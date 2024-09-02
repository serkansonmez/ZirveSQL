 --alter view VW_IndirilecekKDVListesi as 
select   ROW_NUMBER() OVER(ORDER BY FATURA.EVRAKTAR) AS SIRANO,
       format( FATURA.EVRAKTAR,'dd.MM.yyyy') as EVRAKTAR , 
	   '' AS ALISFATURASISERISI,
	      FATURA.EVRAKNO,
		  CARIGEN.STA AS CARIADI  ,
		  CARIGEN.VERGINO,
		  FATURA_ALT.STA AS MALZEMEADI,
		   CAST(sum(FATURA_ALT.MIKTAR)  AS VARCHAR(14)) + ' ' + max(STB) AS ALINANMIKTARBIRIM,
		  sum(KDVTL) as kdv,
		  sum(TUTARTL) as tutar,
		  '' AS GGBTescilNo,
		--  REPLACE(STR(id, 4), SPACE(1), '0')
		  cast(year(FATURA.EVRAKTAR) as varchar(20)) +  REPLACE(STR(month(FATURA.EVRAKTAR),2), SPACE(1), '0')   as Donem
		--FATURA_ALT.P_ID,KDVY= isnull(KDVY,0)  ,KDVTL= isnull(KDVTL,0) ,TEVKTL= isnull(TEVKTL,0)  
		--,FATURA_ALT.STA AS MALZEMEADI
		--,FATURA_ALT.*
		 
	from 
	FATURA_ALT 
	LEFT JOIN FATURA ON FATURA.P_ID = FATURA_ALT.P_ID
	LEFT JOIN CARIGEN ON FATURA.CRK = CARIGEN.CRK
 
	WHERE 
	1=1  
	--KDVMUHKODU LIKE '360%' AND

	 --STA LIKE 'NA%'   AND 
	 
	--  and  FATURA.EVRAKNO = 'OB02022000011752'
	 -- and  cast(year(FATURA.EVRAKTAR) as varchar(20)) +  REPLACE(STR(month(FATURA.EVRAKTAR),2), SPACE(1), '0') = '202206'
	and CARIGEN.crk like '320%'
	   group by  
	   FATURA.EVRAKTAR,
	   
	      FATURA.EVRAKNO,
		  CARIGEN.STA   ,
		  CARIGEN.VERGINO,
		  FATURA_ALT.STA  
		 
 
	-- SELECT * FROM FATURA
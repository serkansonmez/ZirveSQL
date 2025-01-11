SELECT CBKISLEMREF SATIRNO,
		'Ge�erli' as IPTALDURUMU,
		ISLEMAC AS FATURATURU
		, CASE WHEN TUTARB>0 THEN TUTARB ELSE TUTARA END - FATURA_ALT.KDVTL  AS TUTAR
	   , cast(CASE WHEN TUTARB>0 THEN TUTARB ELSE TUTARA END as float) AS NETTUTAR
		,FATURA_ALT.KDVTL KDVTUTAR
		,EVRAKNO AS FATURANO
		,TARIH AS FATURATARIHI
		,CARIGEN.CRK AS CARINO
		,CARIGEN.STA AS CARIADI
		,CARIGEN.SEHIR
		,CARIGEN.VERGID
		,CARIGEN.VERGINO
		,0 ISYERINO
		,CARIGEN.SEMT AS ISYERIADI
		,0 BOLUMNO
		,CARIGEN.SEMT AS BOLUMADI
		,YEAR(TARIH) AS YIL
		,MONTH(TARIH) AS AY
		, CASE WHEN TUTARB>0 THEN TUTARB ELSE TUTARA END - FATURA_ALT.KDVTL  AS VERGIMATRAHI
		,TEVKTL
 
		 ,EVRAKP_ID
		FROM CARI_EKSTRE('120.9980824386','20220101','20220131')
		LEFT JOIN (select 
		P_ID,KDVY=SUM(isnull(KDVY,0)),KDVTL=SUM(isnull(KDVTL,0)),TEVKTL=SUM(isnull(TEVKTL,0))   
	from 
	FATURA_ALT GROUP BY P_ID) FATURA_ALT ON FATURA_ALT.P_ID = EVRAKP_ID
	   LEFT JOIN CARIGEN ON CARIGEN.P_ID = CARIP_ID
 
	WHERE TEVKTL>0

	--2398,79
	SELECT  *  FROM FATURA_ALT  WHERE EN5 = 'TGR2022000000012'
 
SELECT * FROM FATURA_ALT WHERE P_ID IN (
'c40z51a8-a1ed-4rff-903b-5v37437f91f5') ,
'854z2bc2-d0db-4rea-9162-3v3391d8725c',
'8d1zc0ae-32ac-4r05-b0e3-fv5f7991efb7',
'c87z08fa-44e1-4r4d-b004-2vb4d0517878',
'f11zcfee-8d93-4rba-bd0a-avc28a497a84',
'179ze183-e7d6-4r11-ad2b-bv15e84baf16')
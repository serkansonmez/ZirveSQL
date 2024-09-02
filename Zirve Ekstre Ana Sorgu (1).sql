SELECT CARIGEN.P_ID As Referans,CRK as CariHesapKodu,STA as CariAdi,EPOSTA as EMail,VERGINO as VergiNo,
isnull(Adet,0) as Adet,GuncelBakiye,GuncelBakiyeTuru,isnull(AylikToplam,0) as AylikToplam   FROM 
  (SELECT   CARIKODU,   abs( ROUND(SUM(bAKIYESI),2))     as GuncelBakiye,  
CASE WHEN  ROUND(SUM(bAKIYESI),2)>0 THEN 'B' WHEN  ROUND(SUM(bAKIYESI),2)< 0 THEN 'A' ELSE ' ' END    AS GuncelBakiyeTuru   
  FROM CARIDURUM() where CARIKODU is not null 
GROUP BY CARIKODU 
) TBL 

left join (select GMHK,count(GENELTOPLAM) AS Adet,sum(GENELTOPLAM) as AylikToplam from [LISTEFATURA]() t1 where  month(t1.EVRAKTAR) =6 group by GMHK ) t1  
ON TBL.CARIKODU = t1.GMHK

LEFT join CARIGEN ON CARIGEN.CRK = TBL.CARIKODU

where   CARIKODU like '120.%'


--select GMHK,count(GENELTOPLAM) AS EvrakSayisi,sum(GENELTOPLAM) as AylikToplam from [LISTEFATURA]() t1 where  month(t1.EVRAKTAR) =6 group by GMHK 
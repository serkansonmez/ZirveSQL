USE [zirvegenel]
GO

/****** Object:  View [dbo].[VW_CariBakiye_2025]    Script Date: 13.01.2025 09:57:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








  CREATE view [dbo].[VW_CariBakiye_2025] as 
Select   top 1000000 CARI_REF=Max(REF), CARIGEN.CRK AS CARIKODU,CARIGEN.STA AS CARIADI, BAKIYE=ROUND(Isnull(sum(TUTARB),0)-Isnull(sum(TUTARA),0),2)  
,CASE WHEN ROUND(Isnull(sum(TUTARB),0)-Isnull(sum(TUTARA),0),2)<0 THEN 'A' 
      WHEN ROUND(Isnull(sum(TUTARB),0)-Isnull(sum(TUTARA),0),2)>0 THEN 'B' 
	  ELSE '' END AS BAKIYETURU, CARIGEN.OZELKOD2 
	  ,ODEMESURESI
	  ,CARIGEN.P_ID
	  ,YETKILI
	  ,ADRES1
	  ,ADRES2
	  ,AKTEL + TEL  AS 'TELEFON'
	  ,AKFAX + FAX  AS 'FAX'
	  ,VERGINO
	  ,VERGID
	  ,EPOSTA
	  ,WEB
from [TU�RAL_D�K�M_LTD_2025T]..CARIT_ISLEM_TUTAR_DVZ() left join [TU�RAL_D�K�M_LTD_2025T]..CARIGEN on CARIP_ID=P_ID
  WHERE   LEN(CARIGEN.CRK )>3 and CARIGEN.STA LIKE '%%'
group by CARIP_ID,CARIGEN.CRK,CARIGEN.STA ,CARIGEN.OZELKOD2 ,ODEMESURESI,CARIGEN.P_ID,
   YETKILI
	  ,ADRES1
	  ,ADRES2
	  ,AKTEL , TEL  
	  ,AKFAX , FAX   
	  ,VERGINO
	  ,VERGID
	  ,EPOSTA
	  ,WEB
ORDER BY CRK
--SELECT * FROM [TU�RAL_D�K�M_LTD_2025T]..CARIGEN WHERE LEN(OZELKOD) >1 'TAK�P'






GO


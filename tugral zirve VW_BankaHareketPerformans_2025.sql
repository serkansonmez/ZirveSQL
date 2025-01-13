USE [zirvegenel]
GO

/****** Object:  View [dbo].[VW_BankaHareketPerformans_2025]    Script Date: 13.01.2025 09:56:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_BankaHareketPerformans_2025] as 
select ROW_NUMBER() OVER(ORDER BY TARIH ASC) AS CBKP_ID, CBKISLEMREF,CARIREF,BANKAREF,TARIH,SAAT,BORA,ISLEMTURU,ISLEMAC,BANKTISLEM.SUBE,EVRAKNO,BANKTISLEM.ACIKLAMA,TUTARB,TUTARA,VADETARIHI,CARIADI,MASRAFMERKEZI,KASAADI,BANKAADI,SUBESI,HESAPADI,
HESAPNO,IBAN,TUTARB -  TUTARA as BAKIYE , TUTARDB,TUTARDA, TUTARDB -  TUTARDA as BAKIYED ,year(TARIH) as YIL, month(TARIH) As AY,OZELKOD ,OZELKOD1,OZELKOD2,Degerler.ACIKLAMA as OZELKOD1ACIKLAMA,[dovizcin].Dovizcinsi FROM
[TU�RAL_D�K�M_LTD_2025T]..BANKT_ISLEM () as BANKTISLEM
LEFT JOIN  [TU�RAL_D�K�M_LTD_2025T]..BANKGEN wIth(nolock) ON BANKGEN.BANKAREFNO=BANKTISLEM.BANKAREF
LEFT JOIN [zirvegenel].[dbo].[dovizcin] wIth(nolock) ON [zirvegenel].[dbo].[dovizcin].Kod=BANKGEN.DOVIZC
LEFT JOIN  [TU�RAL_D�K�M_LTD_2025T]..Degerler wIth(nolock) ON Degerler.Kod=BANKTISLEM.OZELKOD1 and ALANADI = 'OZELKOD1'
WHERE ISNULL(BANKAREF,0)>0 


GO



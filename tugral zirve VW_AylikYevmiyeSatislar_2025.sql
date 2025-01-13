USE [zirvegenel]
GO

/****** Object:  View [dbo].[VW_AylikYevmiyeSatislar_2025]    Script Date: 13.01.2025 09:56:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[VW_AylikYevmiyeSatislar_2025] as 
 
select top 100000 month(fistar) as Ay, 
--gmkod as 'Hesap Kodu',
--(select hesplan.aciklama from hesplan where gmkod   =kod   ) as 'Hesap Ad�',
--fistar as 'Fi� Tarihi',fistur as 'Fi� T�r�',fisno as 'Fi� No',yevno as 'Yevmiye No',
aciklama as 'A��klama',
--borclu as 'Bor� Tutar�', 
sum(alacakli ) as 'Alacak Tutar�',
 Round(max(tblAylikSatislar.AylikToplamSatis),2) as AylikToplamSatis,
 round((sum(alacakli ) / Round(max(tblAylikSatislar.AylikToplamSatis),2) * 100),4) as Yuzde
 
--Refno,Refno2 as 'SiraNo', Sube as '�ube', Masrafmerkezi as 'Masraf Merkezi',
--Stk as 'Stok Kodu', Miktar as 'Miktar', 
--(select dovizcinsi from zirvegenel..dovizcin 
--where (isnull(Dovizadi,0)=kod) and (kod>1)) as 'Para Birimi', Doviz as 'D�viz Tutar�',
--Evraktarihi as 'Evrak Tarihi',Evrakno as 'Evrak No',Vergino,Serino,Belge_Turu,Belge_Turu_Aciklamasi 
from [TU�RAL_D�K�M_LTD_2025].dbo.yevmiye 
left join (select month(fistar) as Ay, 
sum(alacakli ) as 'AylikToplamSatis'
from [TU�RAL_D�K�M_LTD_2025].dbo.yevmiye where gmkod LIKE '600%'  and (Islemtipi  IN (1,3))    
group by month(fistar) ) tblAylikSatislar on tblAylikSatislar.Ay = month(fistar)
 

where gmkod LIKE '600%'  and (Islemtipi  IN (1,3))    
group by Aciklama,month(fistar)
 order by Ay,sum(alacakli ) desc


GO



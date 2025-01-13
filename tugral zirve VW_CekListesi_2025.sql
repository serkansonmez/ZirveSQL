USE [zirvegenel]
GO

/****** Object:  View [dbo].[VW_CekListesi_2025]    Script Date: 13.01.2025 09:57:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




 CREATE view  [dbo].[VW_CekListesi_2025] as 
SELECT top 1000000  CONVERT(NUMERIC(10,0),VADE) AS AGRUP,ISNULL(BORDROCEKLER.TUTAR,0)-ISNULL(KISMILER.KISMITAHSILTL,0) AS TUTARBAKIYE,
--ISNULL(BORDROCEKLER.DVZMIKTAR,0)-ISNULL(KISMILER.KISMITAHSILD,0) AS DVZMIKTAR,
month(VADE) as AY,ASILCARIUNVANI=CASE WHEN ISNULL(CARIADI,'') <> '' THEN CARIADI ELSE (SELECT ISNULL(STA,'') FROM  [TU�RAL_D�K�M_LTD_2025T]..CARIGEN WHERE P_ID = ISNULL(BORDROCEKLER.ASILCARIP_ID,'')) END,BORDROCEKLER.* FROM  [TU�RAL_D�K�M_LTD_2025T]..BORDROCEKLER LEFT JOIN (SELECT CEK_PID,SUM(ISNULL(KODEMETL,0)) AS KISMITAHSILTL,SUM(ISNULL(KODEMED,0)) AS KISMITAHSILD FROM [TU�RAL_D�K�M_LTD_2025T]..BORDROCEKLER WHERE BRDTUR = 106 AND DURUM IN (11,16) AND DDTARIHI <= '20251251'group by CEK_PID) AS KISMILER ON KISMILER.CEK_PID = BORDROCEKLER.CEK_PID 
WHERE  ( Vade>='20250101'  ) and (Durum IN (2,12)) and  Tur IN (1)  

and (REF IN (SELECT MAX(REF) FROM [TU�RAL_D�K�M_LTD_2025T]..BORDROCEKLER AS ALT WHERE ALT.CEK_PID = BORDROCEKLER.CEK_PID AND DDTARIHI=(SELECT MAX(DDTARIHI) FROM [TU�RAL_D�K�M_LTD_2025T]..BORDROCEKLER AS AALT WHERE AALT.CEK_PID=BORDROCEKLER.CEK_PID AND AALT.DDTARIHI <='20251251') ))  



--and CEKNO = '0015843'
order by VADE


GO


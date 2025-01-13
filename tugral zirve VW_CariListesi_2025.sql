USE [zirvegenel]
GO

/****** Object:  View [dbo].[VW_CariListesi_2025]    Script Date: 13.01.2025 09:57:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




 CREATE view [dbo].[VW_CariListesi_2025] as 
SELECT REF,STA,CRK FROM [TUÐRAL_DÖKÜM_LTD_2025T]..CARIGEN where CariBakiyesi is not null


GO



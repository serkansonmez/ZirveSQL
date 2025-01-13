USE [zirvegenel]
GO

/****** Object:  View [dbo].[VW_BankaIcmaliPerformans2025]    Script Date: 13.01.2025 09:56:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create view [dbo].[VW_BankaIcmaliPerformans2025] as 
select BANKAADI as BankaAdi,DovizCinsi, round(SUM(TUTARB- TUTARA),2) AS Bakiye from VW_BankaHareketPerformans_2025 GROUP BY  BANKAADI,DovizCinsi --order by bakiye desc


GO



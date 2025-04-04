
DECLARE @CLREFERANS INT
DECLARE @CODE VARCHAR(100)
DECLARE @DEFINITION_ VARCHAR(200)
DECLARE @PARENTCODE VARCHAR(100)
DECLARE @PARENTDEFINITION_ VARCHAR(200)

DECLARE @FirmalarId [int] 
DECLARE @AnaGrup [varchar](255) 
DECLARE @AltGrup [varchar](255) 
DECLARE @GrupDetay [varchar](255) 
DECLARE @GrupAltDetay [varchar](255) 
DECLARE @GrupKodu [varchar](255) 
DECLARE @GrupKodu2 [varchar](255)
DECLARE @HesapKodu [varchar](255) 
DECLARE @HesapAdi [varchar](255) 
DECLARE @BA [varchar](50) 
DECLARE @UnityLref[int] 
DECLARE @KayitTarihi [datetime] 

DECLARE processes CURSOR FOR

select DISTINCT CL.LOGICALREF, kod,MASRAFADI 
,SUBSTRING(kod, 1, LEN(kod) - CHARINDEX('.', REVERSE(kod)))  AS PARENTCODE 

 from  Vw_ZirveMizan_2022 VW_007_22_PERFORMANS
left join  [MuhasebeGruplari] on HesapKodu collate SQL_Latin1_General_CP1254_CI_AS = VW_007_22_PERFORMANS.kod 
LEFT JOIN  TUĞRAL_DÖKÜM_LTD_2022.. hesplan   PARENTTABLE ON PARENTTABLE.CODE collate SQL_Latin1_General_CP1254_CI_AS =  SUBSTRING(kod, 1, LEN(kod) - CHARINDEX('.', REVERSE(kod))) 
--LEFT JOIN unity.dbo.LG_007_CLCARD CL ON MASRAFKODU = CL.CODE
where [MuhasebeGruplari].HesapAdi  is null -- and MASRAFKODU = '196.01.137'
AND kod <>
 SUBSTRING(kod, 1, LEN(kod) - CHARINDEX('.', REVERSE(kod)))
OPEN processes

FETCH NEXT FROM processes
INTO @CLREFERANS, @CODE,@DEFINITION_,@PARENTCODE
WHILE @@FETCH_STATUS = 0
BEGIN
     SELECT TOP 1 @FirmalarId=FirmalarId
	 ,@AnaGrup = AnaGrup
,@AltGrup = AltGrup
,@GrupDetay = GrupDetay
,@GrupAltDetay = GrupAltDetay
,@GrupKodu = GrupKodu
,@GrupKodu2 = GrupKodu2

,@BA = BA
,@KayitTarihi  = getdate()
 FROM [Ginsoft_web].[dbo].[MuhasebeGruplari]  WHERE FirmalarId= 4 and HesapKodu like @PARENTCODE + '%'
     
	-- SELECT @CODE,@DEFINITION_,@PARENTCODE
	SET @HesapKodu = @CODE
	SET @HesapAdi = @DEFINITION_

	 INSERT INTO [dbo].[MuhasebeGruplari]
           ([FirmalarId]
           ,[AnaGrup]
           ,[AltGrup]
           ,[GrupDetay]
           ,[GrupAltDetay]
           ,[GrupKodu]
           ,[GrupKodu2]
           ,[HesapKodu]
           ,[HesapAdi]
           ,[BA]
           ,[KayitTarihi]
		   ,UnityLref)
     VALUES
           (@FirmalarId
           ,@AnaGrup
           ,@AltGrup
           ,@GrupDetay
           ,@GrupAltDetay
           ,@GrupKodu
           ,@GrupKodu2
           ,@HesapKodu
           ,@HesapAdi
           ,@BA
           ,@KayitTarihi
		   ,@CLREFERANS)


FETCH NEXT FROM processes
INTO @CLREFERANS,@CODE,@DEFINITION_,@PARENTCODE
END

CLOSE processes
DEALLOCATE processes



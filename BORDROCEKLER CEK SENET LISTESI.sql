 

--SELECT * FROM [CEKSENET_LST]() WHERE TUTAR = 129500
alter View VW_CekHareketleri as 
SELECT BORDROCEKLER.P_ID, VADE,BORCLU,TNZMTAR, CEKDURUMLARI.DURUM, CEKDURUMLARI.ACIKLAMA AS CEKDURUMU,
--,case   BRDTUR WHEN 100 THEN 'Fortföyde' 
--													    WHEN 107 THEN 'Fortföyde'
--														WHEN 103 THEN 'Teminatta' ELSE '' END as Durum,
case   TUR WHEN 3 THEN 'Müşteri Çeki' 
													     ELSE '' END as CekSenetTuru,
 CEKNO,
 BORDRONO,BORDRONOS_S,
 BANKA.BANKAADI, SUBESI , PRTFYNO,PRTFYNOS_S,
 BANKA AS CEKBANKA, BANKASUBE AS CEKBANKASUBE , TUTAR --, *
 FROM   BORDROCEKLER  
LEFT JOIN CEKDURUMLARI ON CEKDURUMLARI.DURUM = BORDROCEKLER.DURUM
 LEFT JOIN LISTEBANKALAR()  BANKA ON BANKA.P_ID = BORDROCEKLER.BRDBANKAP_ID
--WHERE   PRTFYNO = 2360 --  TUTAR = 203000

--select * from LISTEBANKALAR()
--SELECT * FROM CEKDURUMLARI

 --select * from VW_CekHareketleri
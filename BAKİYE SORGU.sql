SELECT   TBL.BAKIYE,  * FROM [LISTEFATURA]() 
LEFT JOIN (SELECT CARIKODU, CAST(ROUND(SUM(bAKIYESI),2) AS VARCHAR(20)) +  ' (' +
CASE WHEN  ROUND(SUM(bAKIYESI),2)>0 THEN 'B' WHEN  ROUND(SUM(bAKIYESI),2)< 0 THEN 'A' ELSE '-' END + ')'  AS BAKIYE FROM CARIDURUM() GROUP BY CARIKODU
) TBL ON TBL.CARIKODU = GMHK


SELECT   TBL.BAKIYE,  * FROM [LISTEFATURA]() 
LEFT JOIN (SELECT CARIKODU, CAST(ROUND(SUM(bAKIYESI),2) AS VARCHAR(20)) +  ' (' +
CASE WHEN  ROUND(SUM(bAKIYESI),2)>0 THEN 'B' WHEN  ROUND(SUM(bAKIYESI),2)< 0 THEN 'A' ELSE '-' END + ')'  AS BAKIYE FROM CARIDURUM() GROUP BY CARIKODU
) TBL ON TBL.CARIKODU = GMHK
 
WHERE EVRAKTAR = '20220628'
SELECT CARIKODU,COUNT(CARIKODU) FROM CARIDURUM() GROUP BY CARIKODU
SELECT CARIKODU, CAST(ROUND(SUM(bAKIYESI),2) AS VARCHAR(20)) +  ' (' +
CASE WHEN  ROUND(SUM(bAKIYESI),2)>0 THEN 'B' WHEN  ROUND(SUM(bAKIYESI),2)< 0 THEN 'A' ELSE '-' END + ')'  AS BAKIYE FROM CARIDURUM() GROUP BY CARIKODU

SELECT * FROM   [LISTEFATURA]()


SELECT ROUND(SUM(bAKIYESI),2) FROM CARIDURUM() WHERE CARIKODU = '120.0010745339'

SELECT*  FROM CARIDURUM() WHERE CARIKODU = '120.0010745339'
Select REF=Max(REF), Round(SUM(TUTARB),6) -  Round(SUM(TUTARA),6)  
from CARIT_ISLEM_TUTAR() left join CARIGEN on CARIP_ID=P_ID 
--WHERE CARIGEN.CRK =   '120.0430367835'
group by CARIP_ID 
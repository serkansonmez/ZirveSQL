
select
  HPlan.Kod,
  Cinsi=cast(Null as nvarchar(10)),
  Aciklama=Hplan.Aciklama,
  HPlan.Detay,
  BorcMiktar=cast(Null as float),
  AlacakMiktar=cast(Null as float),
  YevTop.Borc,
  YevTop.Alacak,
  BBorc=case when YevTop.Borc>isNull(YevTop.Alacak,0) then YevTop.Borc-isNull(YevTop.Alacak,0) end,
  BAlacak=case when YevTop.Alacak>isNull(YevTop.Borc,0) then YevTop.Alacak-isNull(YevTop.Borc,0) end,
  BBorcMiktar=cast(Null as float),
  BAlacakMiktar=cast(Null as float)
from hesplan as HPlan left join
(select
    Gmkod,
    Borc=sum(Borclu),
    Alacak=sum(Alacakli)
  from
    yevmiye
  as Yev
  where (((Fistur<>'9')) and (((Fistar>='01.01.2022')and(Fistar<='31.12.2022')) and (Islemtipi  IN (1,3)))) and (((((Gmkod>='100')and(Gmkod<='961'))) or ((CharIndex(Left(Gmkod,3),'100')=1) or (CharIndex(Left(Gmkod,3),'961')=1))))
  group by Gmkod 
  having isNull(round(sum(Borclu),2),0)+isNull(round(sum(Alacakli),2),0)>0)
  as YevTop
on Kod  COLLATE Turkish_CS_AS =Gmkod  COLLATE Turkish_CS_AS 
where (isNull(Borc,0)+isNull(Alacak,0)>0)
and ((((Kod>='100')and(Kod<='961'))) or ((CharIndex(Left(Kod,3),'100')=1) or (CharIndex(Left(Kod,3),'961')=1)))
or isNull(HPlan.Detay,'H')='H' or (LTrim(HPlan.Detay)='')
order by Kod
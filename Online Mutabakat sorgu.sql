select * from OnlineMutabakat where LinkId=  '863z8e82-7718-4r16-9fd3-bv9be9c1d1d4'

select LinkId,count(LinkId) from OnlineMutabakat group by LinkId having count(LinkId)>1  --1156
select LinkId,count(LinkId) from OnlineMutabakat group by LinkId having count(LinkId)=1  --1156

-- select * from OnlineMutabakat where aY = 9 AND MutabakatTarihi is null
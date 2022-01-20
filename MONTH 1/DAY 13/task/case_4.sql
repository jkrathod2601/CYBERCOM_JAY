create table Weather(
	id int not null auto_increment primary key,
    recordDate datetime not null,
    temperature int not null
);

select * from Weather;

select t1.id
from Weather t1
where 1 = (
select count(t2.temperature) from Weather t2 where (DATEDIFF(t2.recordDate,t1.recordDate)=-1) 
and t1.temperature > t2.temperature and t2.recordDate < t1.recordDate
);
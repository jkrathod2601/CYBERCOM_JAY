create table Logs(
	id int auto_increment primary key,
    num int not null
);

select * from Logs;

select distinct e1.num
from Logs e1
where 3=(select count(e2.id) from Logs e2 where e1.id-e2.id<3 and e1.id-e2.id>=0  and e1.num=e2.num);


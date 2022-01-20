create table Employee_2(
	id int not null auto_increment primary key,
    salary int not null
);

select * from Employee_2;

select e1.salary 
from Employee_2 e1
where 0=(select count(distinct e2.salary) from Employee_2 e2 where e2.salary>e1.salary);
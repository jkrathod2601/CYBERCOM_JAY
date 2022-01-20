create database if not exists testting_day13;
use testting_day13;

create table Person(
 id int auto_increment not null primary key,
 email varchar(20) not null
);

insert into person(email)
values ("a@b.com"),
("c&d.com"),
("A@B.com"),
("c&d.com"),
("d&c.com");

select * from person;

select email
from person
group by lower(email)
having count(email)>1;


-- --problem --2

create table department (
	id int auto_increment primary key,
    name varchar(20) not null
);

select * from department;

 create table employees(
 id int auto_increment primary key,
 name varchar(20) not null,
 salary int not null,
 departmentId int not null,
 foreign key (departmentId) references Department(id)
 )
	
select * from employees;



select d.Name Department, e1.Name Employee, e1.Salary
from employees e1 
join Department d
on e1.DepartmentId = d.Id
where 3 > (select count(distinct(e2.Salary)) 
                  from Employees e2 
                  where e2.Salary > e1.Salary 
                  and e1.DepartmentId = e2.DepartmentId
                  );






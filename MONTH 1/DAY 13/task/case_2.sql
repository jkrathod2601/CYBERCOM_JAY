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
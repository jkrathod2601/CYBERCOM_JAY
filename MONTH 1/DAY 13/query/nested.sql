-- subqueries //  inner queries  // nested queries

-- >> subqueries are the part of other query

select first_name , last_name from employees
where emp_no in (select emp_no from dept_manager);

-- exists and no

select first_name , last_name 
from employees where 
exists (select * from dept_manager
where dept_manager.emp_no=employees.emp_no);

-- exists >> tests row values fro existence
--        >> quicker in retriving large amount of data

-- in >> serch among value
--    >> faster with smaller data set

select employees.emp_no as employeid , min(dept_emp.emp_no) as department_code,
(select emp_no from dept_manager where emp_no=110022) as managerId
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
where employees.emp_no <= 10020
group by employees.emp_no
order by employees.emp_no;


-- select subquery from 
select A. * from (select employees.emp_no as employeid , min(dept_emp.emp_no) as department_code,
(select emp_no from dept_manager where emp_no=110022) as managerId
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
where employees.emp_no <= 10020
group by employees.emp_no
order by employees.emp_no) as A;


-- SELF JOIN
create table rr(
 client_id int not null,
 manager_id int not null
);

select * from rr;

insert into rr(client_id,manager_id) values (1,2),(2,3),(3,4);

select r1.client_id 
from rr r1
join rr  r2 on r1.client_id=r2.manager_id;
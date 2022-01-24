-- 1)Find the average salary of the male and female employees in each department.

select distinct employees.gender,dept_emp.dept_no,avg(salaries.salary)
from employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join salaries on employees.emp_no=salaries.emp_no
where employees.gender="F"
group by dept_no
union
select distinct employees.gender,dept_emp.dept_no,avg(salaries.salary)
from employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join salaries on employees.emp_no=salaries.emp_no
where employees.gender="M"
group by dept_no
;


-- 2)Find the lowest department number encountered in the 'dept_emp' table. Then, find the highest department number.

max:
select dept_no,count(dept_no) as A1
from dept_emp
group by dept_no
order by A1 desc
limit 1;

min:
select dept_no,count(dept_no) as A1
from dept_emp
group by dept_no
order by A1 asc
limit 1;


-- 3)Obtain a table containing the following three fields for all individuals whose employee number is not
-- greater than 10040:
-- - employee number
-- - the lowest department number among the departments where the employee has worked in (Hint: use 
-- a subquery to retrieve this value from the 'dept_emp' table)
-- - assign '110022' as 'manager' to all individuals whose employee number is lower than or equal to 10020, 
-- and '110039' to those whose number is between 10021 and 10040 inclusive.
-- Use a CASE statement to create the third field.
-- If you've worked correctly, you should obtain an output containing 40 rows.
-- Here’s the top part of the output. Does it remind you of an output you’ve obtained earlier in the course?

select d1.emp_no , d1.dept_no,"110022" as manager
from dept_emp d1
where d1.dept_no in (select min(d2.dept_no) from dept_emp d2 where d1.emp_no=d2.emp_no)  and d1.emp_no <= 10020
union 
select d1.emp_no , d1.dept_no,"110039" as manager
from dept_emp d1
where d1.dept_no in (select min(d2.dept_no) from dept_emp d2 where d1.emp_no=d2.emp_no)  and d1.emp_no <= 10040;


-- 4)Retrieve a list of all employees that have been hired in 2000

select * from employees
where year(hire_date)=2000;

-- 5)Retrieve a list of all employees from the ‘titles’ table who are engineers.
-- Repeat the exercise, this time retrieving a list of all employees from the ‘titles’ table who are senior 
-- engineers.
-- After LIKE, you could indicate what you are looking for with or without using parentheses. Both options 
-- are correct and will deliver the same output. We think using parentheses is better for legibility and that’s 
-- why it is the first option we’ve suggested

select e1.emp_no , e1.first_name , e2.title
from employees e1
inner join titles e2 on e1.emp_no=e2.emp_no
where e2.title like "E%";

select e1.emp_no , e1.first_name , e2.title
from employees e1
inner join titles e2 on e1.emp_no=e2.emp_no
where e2.title like "Senior E%";


-- 6)Create a procedure that asks you to insert an employee number and that will obtain an output containing 
-- the same number, as well as the number and name of the last department the employee has worked in.
-- Finally, call the procedure for employee number 10010.
-- If you've worked correctly, you should see that employee number 10010 has worked for department 
-- number 6 - "Quality Management".
DELIMITER //
CREATE PROCEDURE userinfo(user_emp_no Bigint)
	SELECT e1.emp_no,e2.dept_name
    from dept_emp e1
    inner join departments e2 on e1.dept_no=e2.dept_no
    where e1.emp_no=user_emp_no order by dept_name desc limit 1;
END //
DELIMITER ;

call userinfo(10010);


-- 7)How many contracts have been registered in the ‘salaries’ table with duration of more than one year and 
-- of value higher than or equal to $100,000? 
-- Note: Apply this exercise for non-leap years only.
-- Hint: You may wish to compare the difference between the start and end date of the salaries contracts to 
-- the number of seconds there are in a non-leap year.
select count(*)
 from salaries 
 where datediff(to_date,from_date)>=365 and salary>=100000
 and year(from_date) % 4 != 0;


-- 8)Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set the 
-- hire date to equal the current date. Format the output appropriately (YY-mm-dd).
-- Extra challenge: You can try to declare a new variable called 'today' which stores today's data, and then 
-- use it in your trigger!
-- After creating the trigger, execute the following code to see if it's working properly.


-- 9)Define a function that retrieves the largest contract salary value of an employee. Apply it to employee 
-- number 11356.
-- In addition, what is the lowest contract salary value of the same employee? You may want to create a new 
-- function that to obtain the result.

-- MAX:
DELIMITER $$
 create function getmaximumsalary(emp_no_is int(10))
 returns int(10) DETERMINISTIC
 begin 
 declare max_salary int(10);
 
 select 
 max(salary)
 into max_salary
 from salaries 
 where emp_no=emp_no_is;
 return max_salary;
 end$$
 
 DELIMITER ;
-- MIN:
DELIMITER $$
 create function getminmumsalary(emp_no_is int(10))
 returns int(10) DETERMINISTIC
 begin 
 declare min_salary int(10);
 
 select 
 min(salary)
 into min_salary
 from salaries 
 where emp_no=emp_no_is;
 return min_salary;
 end$$
 
 DELIMITER ;

select getminmumsalary(11356);
select getmaximumsalary(11356);


-- 10)Based on the previous exercise, you can now try to create a third function that also accepts a second
-- parameter. Let this parameter be a character sequence. Evaluate if its value is 'min' or 'max' and based on 
-- that retrieve either the lowest or the highest salary, respectively (using the same logic and code structure 
-- from Exercise 9). If the inserted value is any string value different from ‘min’ or ‘max’, let the function 
-- return the difference between the highest and the lowest salary of that employee.

DELIMITER $$
 create function getsalary(emp_no_is int(10),type_of varchar(5))
 returns int(10) DETERMINISTIC
 
 begin 
 declare _salary int(10);
 
 select 
	case when type_of like "max" then max(salary)  else min(salary) end
    into _salary
 from salaries 
 where emp_no=emp_no_is;
 
 return _salary;
 end$$
 
 DELIMITER ;

select getsalary(11356,"max");
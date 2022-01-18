select avg(salary) as avrage from salaries;
-- max
select max(salary) as maxis from salaries;
-- min
select min(salary) as minis from salaries;
-- sum
select sum(salary) as sumis from salaries;
-- count
select count( distinct first_name) from employees; 


-- count the row
select count(*) from t1;

-- round(data,decimal_place)

select round(avg(id)) from t1;

-- 2 point after the point
select round(avg(id),2) from t1;

-- IFNULL() and COALESCE()
-- IFNULL(expression_1,expression_2)

SELECT 
    dept_no, IFNULL(depe_name, 'this is nullvalue')
FROM
    departments;

-- COALESCE(e_1,e_2,....,e_n)
-- > allows you to insert n argument in the parentheses

-- first argument 1 is cheack and then if it is null then go for the next argu and thent if it is nulll also then they 
-- add the this is null value
SELECT 
    dept_no, COALESCE(depe_name,depe_manager,'this is nullvalue')
FROM
    departments;

-- coalesce is also use for making a fake column
select dept_no,dept_id,coalesce("this is fake column") as fake_col
from  departments;

-- ifnull take excect 2 arguments and cpalesce is take one or more then one
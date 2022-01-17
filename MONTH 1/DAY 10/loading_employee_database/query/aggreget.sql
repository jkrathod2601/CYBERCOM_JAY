-- type of aggregate function
-- count() sum() avg() max() min()

-- avg
select avg(salary) as avrage from salaries;
-- max
select max(salary) as maxis from salaries;
-- min
select min(salary) as minis from salaries;
-- sum
select sum(salary) as sumis from salaries;
-- count
select count( distinct first_name) from employees; 
-- how we use this distinct in brackates
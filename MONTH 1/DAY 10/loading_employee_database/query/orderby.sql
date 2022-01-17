-- desending order
select * from employees order by first_name desc;
-- acsennding order
select * from employees order by first_name asc;

-- two column selected with same time
select * from employees order by first_name,last_name asc;
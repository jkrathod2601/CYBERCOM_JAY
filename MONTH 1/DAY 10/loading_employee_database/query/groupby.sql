-- syntax

-- select c1 
-- from table_name
-- where condition
-- group by col_1
-- Order by col_2

-- group by is slower then selecting in distinct

select first_name , count(first_name) as c1 from employees group by first_name;

-- alise means rename your column name in exexuting te querey and AS is the syntax
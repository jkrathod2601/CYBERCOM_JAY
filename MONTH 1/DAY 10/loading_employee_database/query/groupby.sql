-- syntax

-- select c1 
-- from table_name
-- where condition
-- group by col_1
-- Order by col_2

-- group by is slower then selecting in distinct

select first_name , count(first_name) as c1 from employees group by first_name;

-- alise means rename your column name in exexuting te querey and AS is the syntax

-- having is only use in aggregate function in groupby

select first_name , count(first_name) as c1 from employees 
group by first_name having count(first_name)>250 order by first_name asc;

-- task 
SELECT 
    first_name, COUNT(first_name) as c1
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY c1 ASC;
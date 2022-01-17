-- operator
/*
1> AND
2> Or
3> in
4> like
5> between 
6> exists
7>is null
8> comparisoon operator
*/

-- AND
-- combine two statments in condition
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis' and last_name="Coullard";

-- or
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis' or first_name="Coullard";

-- we use and on different column and or in same column
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis' and first_name="colluard";
-- output is 0

-- operator Precedence
-- AND > OR
-- >> in starting that in the execution of the query , the operator AND is applied first and while the
    --   operator or is applied second
    SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis' and gender="F" or gender="M";
    -----------------------------------    -----------
    -- this line is 1 st statment            second statment

-- example how create this query
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis' and (gender="F" or gender="M");


-- IN and NOT IN
-- it takes less time then saparate or statment
-- if we work on large database then this query is more important
select * from employees
where first_name in ("Cathie","Mark","Nathan");

-- not in
select * from employees
where first_name not in ("Cathie","Mark","Nathan");

-- like and not like (it not an case sensetive language or operator)
select * from employees 
where first_name like ('Mar%'); 

-- selecting whene middle of any potion is ar
select * from employees 
where first_name like ('%ar%');

-- selctinig first_name is length of 4 and grater then 4
select * from employees 
where first_name like ('____'); 

select * from employees 
where first_name like ('____%');

-- not like
select * from employees 
where first_name like ('Mar%'); 
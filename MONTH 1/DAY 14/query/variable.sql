use employees;

-- local variable

DELIMITER $$
create function f_avg_salary (p_emp_no integer) returns decimal(10,2)
begin
declare v_avg_salary decimal(10,2);

SELECT 
    AVG(salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_n = s.emp_no
WHERE
    e.emp_no = p.emp_no;

RETURN v_avg_salary;
END $$

DELIMITER $$

-- we cant access beause it is not an local variable -- 
select v_avg_salary;

-- session variable
SET @v_variable_name =3 

-- global connection
SET global max_connections=100;

-- for update the global variable
SET @@global.max_connections=1;


-- how to create index
create index index_name
on table_1 (c_1,c_2);
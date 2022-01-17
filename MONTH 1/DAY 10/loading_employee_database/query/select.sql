-- allows you to extract a fraction of the entr data set 
-- used to query data from a database

-- syntax
-- >>
use employees;
-- for selecting all data  
select * from departments;

-- for selecting specifies column 
SELECT 
    first_name,last_name
FROM
    employees;
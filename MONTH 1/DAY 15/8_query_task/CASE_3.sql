-- Write an SQL query to swap all 'f' and 'm' values 
-- (i.e., change all 'f' values to 'm' and vice versa) with a single update
--  statement and no intermediate temporary tables.Note that you must write a 
--  single update statement, do not write any select statement for this problem.

CREATE TABLE IF NOT EXISTS Salary (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    sex ENUM('m', 'f') NOT NULL,
    salary INT NOT NULL
);

SELECT 
    *
FROM
    Salary;

 
UPDATE Salary 
SET 
    sex = CASE
        WHEN sex = 'm' THEN 'f'
        ELSE 'm'
    END;

SELECT 
    *
FROM
    Salary;
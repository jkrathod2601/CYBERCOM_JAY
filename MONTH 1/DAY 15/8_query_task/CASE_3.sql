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
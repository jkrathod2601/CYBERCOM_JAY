-- Write an SQL query to find the team size of each of the employees.
-- Return result table in any order.

CREATE TABLE Employee (
    employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    team_id INT NOT NULL
);

SELECT 
    *
FROM
    Employee;



-- =======================   QUERY   ===========----------------------

SELECT 
    e1.employee_id,
    (SELECT 
            COUNT(*)
        FROM
            Employee e2
        WHERE
            e1.team_id = e2.team_id) AS team_size
FROM
    Employee e1;
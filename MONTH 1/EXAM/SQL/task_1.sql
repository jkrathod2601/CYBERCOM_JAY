-- Write an SQL query to report the respective department name and number of 
-- students majoring in each department for all departments in the 
-- Department table (even ones with no current students).
-- Return the result table ordered by student_number in descending order. In 
-- case of a tie, order them by dept_name alphabetically.

CREATE TABLE Department (
    dept_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(24) NOT NULL
);
SELECT 
    *
FROM
    Department;
CREATE TABLE Student (
    student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(24) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id)
        REFERENCES Department (dept_id)
);
SELECT 
    *
FROM
    Student;

-- =======================   QUERY   ===========----------------------

SELECT 
    e1.dept_name, COUNT(e2.student_id) AS Student_number
FROM
    Department e1
        LEFT JOIN
    Student e2 ON e1.dept_id = e2.dept_id
GROUP BY e1.dept_name; 
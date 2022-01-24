CREATE TABLE IF NOT EXISTS Courses (
    student VARCHAR(24) NOT NULL,
    class VARCHAR(24) NOT NULL,
    PRIMARY KEY (student , class)
);

SELECT 
    *
FROM
    Courses;

-- Write an SQL query to report all the classes that have at least five students. Return the result table in any order.

SELECT 
    class
FROM
    Courses
GROUP BY class
HAVING COUNT(class) > 5;  
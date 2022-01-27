-- Write a SQL query to find the highest grade with its corresponding course 
-- for each student. In case of a tie, you should find the course with the 
-- smallest course_id.
-- Return the result table ordered by student_id in ascending order.

CREATE TABLE Enrollments (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade INT NOT NULL
);

SELECT 
    *
FROM
    Enrollments;
insert into Enrollments values(2,2,95),(2,3,95),(1,1,90),(1,2,99),(3,1,80),(3,2,75),(3,3,82);

-- =======================   QUERY   ===========----------------------

SELECT DISTINCT
    *
FROM
    Enrollments e1
WHERE
    0 = (SELECT 
            COUNT(0)
        FROM
            Enrollments e2
        WHERE
            e1.student_id = e2.student_id
                AND e1.grade < e2.grade)
GROUP BY student_id
ORDER BY student_id;
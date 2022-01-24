CREATE TABLE IF NOT EXISTS Person (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(64) NOT NULL
);
CREATE TABLE IF NOT EXISTS p2 (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(64) NOT NULL
);
insert into p2
select * from Person;

DELETE FROM Person 
WHERE
    id NOT IN (SELECT 
        MIN(t1.id)
    FROM
        p2 t1
    GROUP BY t1.email);
    
SELECT 
    *
FROM
    Person;

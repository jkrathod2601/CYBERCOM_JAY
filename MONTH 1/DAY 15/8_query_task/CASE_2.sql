use testing;
CREATE TABLE IF NOT EXISTS Cinema (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    movie VARCHAR(64) NOT NULL,
    description VARCHAR(128) NOT NULL,
    rating FLOAT(2 , 1 )
);
SELECT 
    *
FROM
    Cinema;

-- query 
SELECT 
    *
FROM
    Cinema
WHERE
    id % 2 != 0
        AND description NOT LIKE 'boring'
ORDER BY rating DESC;

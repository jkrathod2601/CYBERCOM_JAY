-- Write an SQL query to create index on the email column.

CREATE TABLE IF NOT EXISTS example_6 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(64) NOT NULL
);


-- type 1 
create index i_1
on example_6(email);

-- type 2
CREATE TABLE IF NOT EXISTS example_61 (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(64) NOT NULL,
    INDEX (email)
);
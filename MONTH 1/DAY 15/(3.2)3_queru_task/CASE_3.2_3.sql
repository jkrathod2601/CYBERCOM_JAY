-- A country is big if:

-- · it has an area of at least three million (i.e., 3000000 km2), or

-- · it has a population of at least twenty-five million (i.e., 25000000)

CREATE TABLE IF NOT EXISTS World (
    name VARCHAR(24) NOT NULL,
    continent VARCHAR(24) NOT NULL,
    area INT(20) NOT NULL,
    population INT(20) NOT NULL,
    gdp BIGINT(30) NOT NULL,
    PRIMARY KEY (name)
);

SELECT 
    *
FROM
    World;

SELECT 
    name, population, area
FROM
    World
WHERE
    area >= 3000000
        OR population >= 25000000;
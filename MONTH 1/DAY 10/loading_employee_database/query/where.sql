-- for condition in query

-- for selecting a specifies column
SELECT 
    count(first_name) as f1
FROM
    employees
where first_name="denis";

-- simple where query
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis';
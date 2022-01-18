commit;
-- save the data

UPDATE t2 
SET 
    t2_name = 'jayra',
    id = 10
WHERE
    id = 1;

rollback;
-- going to last commit
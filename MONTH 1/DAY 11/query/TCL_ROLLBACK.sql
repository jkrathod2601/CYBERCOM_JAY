-- commit >> save the transaction in the database
    --    >> change can not be undo

-- roolback >> allows you to take a step back to
    --      >> the last change(s) made will be not count

-- update

UPDATE t2 
SET 
    t2_name = 'jayra',
    id = 10
WHERE
    id = 1;
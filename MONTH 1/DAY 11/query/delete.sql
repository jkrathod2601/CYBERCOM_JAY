--  delete statment

delete from t2
where id=3;

-- delete all table

delete from t2;

-- DROP vs TRUNCATE vs DELETE

-- drop delete the data and also the structure of the table
-- drop table table_name;
drop table t1;

--  truncate only delete the all data but not the structure
truncate table t1;

-- delete only delete the data not any structure 
delete table t1;

-- truncate is faster then the delete because they did't match the condition
-- truncate also drop the vale of auto_increment and they start from the 1
-- delete not reset the value of the auto_increment and start with whene the finish it
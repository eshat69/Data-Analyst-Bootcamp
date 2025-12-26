-- - LIMIT always comes last in the query (after ORDER BY, GROUP BY, HAVING).
-- - Aliases (AS) are optional — you can skip AS and just write the alias name.


/* 
SELECT column1, column2
FROM table_name
ORDER BY column_name ASC|DESC
LIMIT number;
*/
select * from employee_demographics order by age desc ;
select * from employee_demographics order by age desc limit 3  ;  -- limit with 3 rows
select * from employee_demographics order by age desc limit 3 , 1 ; -- select after the 3rd row

/*
SELECT first_name AS fname, last_name AS lname
FROM employee_demographics;
*/
SELECT 	gender , avg(age) as avg_age
from employee_demographics
group by gender
having avg(age) > 40 ; 
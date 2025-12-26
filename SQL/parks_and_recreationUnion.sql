-- union
select age , gender from parks_and_recreation.employee_demographics  
union 
select first_name , last_name from parks_and_recreation.employee_salary ; 

select first_name , last_name 
from parks_and_recreation.employee_demographics  
union                          -- by default is't union distrinct . only unique value is there
select first_name , last_name 
from parks_and_recreation.employee_salary ;

select first_name , last_name 
from parks_and_recreation.employee_demographics  
union all                         -- all values union
select first_name , last_name 
from parks_and_recreation.employee_salary ;
/*
SELECT column1, column2, 'label1' AS label
FROM table1
WHERE condition1
UNION
SELECT column1, column2, 'label2' AS label
FROM table2
WHERE condition2
UNION
SELECT column1, column2, 'label3' AS label
FROM table3
WHERE condition3
ORDER BY column1, column2;
*/
select first_name , last_name , 'old man' as label
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'male'
UNION 
select first_name , last_name , 'old lady' as label
from parks_and_recreation.employee_demographics
where age > 40 and gender = 'female'
UNION
select first_name , last_name , 'highly paid' as label
from parks_and_recreation.employee_salary
where salary > 70000
order by first_name, last_name ;
-- - All SELECT statements in a UNION must have the same number of columns and compatible data types.
-- - Aliases (AS label) are applied to the first query and carried through the union.
-- - ORDER BY applies to the final combined result set, not individual queries.
-- - Use UNION ALL if you want to keep duplicates (plain UNION removes duplicates).

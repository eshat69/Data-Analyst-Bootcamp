-- WHERE → filters rows before aggregation.
-- HAVING → filters groups after aggregation
/*SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
WHERE condition_on_rows                            -- filters rows before grouping
GROUP BY column_name
HAVING AGGREGATE_FUNCTION(column_name) condition;  -- filters groups after aggregation
*/
select gender , avg(age) 
from parks_and_recreation.employee_demographics 
group by gender 
having avg(age) > 40 ;

select * from employee_salary  ; 
select occupation , avg(salary)
from employee_salary 
where occupation LIKE '%man%'             -- filter row level
group by occupation 
having avg(salary) >75000 ;               -- filter aggregate function level
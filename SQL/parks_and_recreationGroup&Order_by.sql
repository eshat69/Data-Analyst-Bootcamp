-- GROUP BY clause
-- gourp together the rows than the same values in the specific column that actualy grouping on 
-- once the group rows together it can run auggregate function on those rows
/* 
COUNT()   Counts rows in each group
SUM()     Adds up values in each group
AVG()     Calculates average per group
MIN()     Finds smallest value in each group
MAX()     Finds largest value in each group
*/
SELECT * FROM parks_and_recreation.employee_demographics ;
SELECT * FROM parks_and_recreation.employee_demographics ;
select distinct gender 
from parks_and_recreation.employee_demographics  ;                 -- only unique values by sdistinct
select gender 
from parks_and_recreation.employee_demographics             
group by gender ;                                                  -- only unique values by group by

select gender , AVG(age) , MAX(age) , MIN(age), count(age)        -- group by gender , aggregate function -> average age, maximum , minimum
from parks_and_recreation.employee_demographics             
group by gender ;
select occupation, salary  , sum(salary) , avg(salary) , max(salary) , min(salary) , count(dept_id)      --  aggregate function -> sum, average, max, min, count 
from parks_and_recreation.employee_salary
group by occupation, salary   ;                                                                            -- group by occupation 
-- order by actully sort the result set either ascending or descending order
-- ASC → Ascending (default, smallest → largest, A → Z)
-- DESC → Descending (largest → smallest, Z → A)

select * from employee_demographics 
order by first_name  DESC ;              --   decending order of first_name
select * from employee_demographics 
order by gender, age  asc ;              -- ASCENDING ORDER of gender
select * from employee_demographics 
order by 5, 4  desc ;                    -- 5th position is gender 4th is age and order by 5th means genter but descending
select * from employee_demographics 
order by 5 desc , 4  asc ;                -- 5th position is gender and descending 4th is age and ascending
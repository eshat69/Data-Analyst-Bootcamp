select * from parks_and_recreation.employee_demographics ;
-- Q1. age 0-35 young , 35-50 old and 50+ death's on door
select first_name , last_name , age ,
case 
	when age <= 35 then 'young' 
    when age between 36 and 50 then 'old'
    when age >= 50 then "death's on door"
end as age_brackets
from employee_demographics ;
select * from employee_salary ;

-- Q2. salary increase and bonus
-- < 50000 -> 5% >50000 -> 7& finance -> extra 10%
select first_name , last_name , salary , dept_id , parks_departments.department_name ,
case 
	when salary < 50000 then salary*1.05
    when salary >= 50000 then salary*1.07
end as new_salary,
case
	when dept_id = 6 then salary*1.10
    when dept_id between 1 and 5 then 'no bonus'
end as bonus 
from employee_salary 
inner join parks_departments
	on employee_salary.dept_id = parks_departments.department_id ;
    
/*
SELECT column1, column2, ... ,
    CASE
        WHEN condition1 THEN result1
        WHEN condition2 THEN result2
        ELSE default_result
    END AS alias1,
    CASE
        WHEN conditionA THEN resultA
        WHEN conditionB THEN resultB
        ELSE default_result
    END AS alias2
FROM table1 AS t1
INNER JOIN table2 AS t2
    ON t1.common_column = t2.common_column
[WHERE condition]
[GROUP BY column_name]
[HAVING aggregate_condition]
[ORDER BY column_name ASC|DESC]
[LIMIT number];
*/
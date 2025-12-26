select * from parks_and_recreation.employee_demographics ;
select * from parks_and_recreation.employee_salary ;
-- inner join 
/* 
SELECT t1.column_name, t2.column_name
FROM table1 AS t1
INNER JOIN table2 AS t2
ON t1.common_column = t2.common_column;
*/
select *
from parks_and_recreation.employee_demographics as dem        -- employee_demographics as dem   
inner join employee_salary as sal                             -- employee_salary as sal
on dem.employee_id = sal.employee_id  ; 
-- outer join 
/* 
Left join
SELECT t1.column_name, t2.column_name
FROM table1 AS t1
LEFT JOIN table2 AS t2
ON t1.common_column = t2.common_column;

right join
SELECT t1.column_name, t2.column_name
FROM table1 AS t1
RIGHT JOIN table2 AS t2
ON t1.common_column = t2.common_column;
*/
select *
from parks_and_recreation.employee_demographics as dem             -- employee_demographics as dem   
left outer join employee_salary as sal                             -- employee_salary as sal
on dem.employee_id = sal.employee_id  ; 
select *
from parks_and_recreation.employee_demographics as dem              -- employee_demographics as dem   
right outer join employee_salary as sal                             -- employee_salary as sal
on dem.employee_id = sal.employee_id  ; 

-- self join 
select * 
from employee_salary em1
join employee_salary em2
on em1.employee_id +1 = em2.employee_id
;
select 
em1.employee_id as s_1 , em1.first_name  as f_n_s_1 , em1.last_name as l_n_s_1 ,
em1.employee_id as s_2 , em1.first_name  as f_n_s_2 , em1.last_name as l_n_s_2 
from employee_salary em1
join employee_salary em2
	on em1.employee_id=em2.employee_id  ;
-- multiple join
/*
SELECT column_list
FROM table1 AS alias1
INNER JOIN table2 AS alias2
    ON alias1.common_column = alias2.common_column
INNER JOIN table3 AS alias3
    ON alias2.common_column = alias3.common_column
WHERE conditions
GROUP BY column_name
HAVING AGGREGATE_FUNCTION(column_name) condition
ORDER BY column_name ASC|DESC
LIMIT number;
*/
select *
from employee_demographics as dem 
inner join employee_salary as sal 
	ON dem.employee_id = sal.employee_id
inner join parks_departments pd
	ON sal.dept_id = pd.department_id 
;

SELECT gender, occupation, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
    ON sal.dept_id = pd.department_id
WHERE age > 35                    --  WHERE → filters rows before grouping ()
GROUP BY gender, occupation       -- GROUP BY → defines how rows are grouped ()
HAVING AVG(salary) > 40000        -- HAVING → filters groups after aggregation (AVG(salary) > 40000)
ORDER BY avg_salary DESC          -- ORDER BY → sorts results (avg_salary DESC)
LIMIT 8 ;                          -- LIMIT → restricts output to 8 rows

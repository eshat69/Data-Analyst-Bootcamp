-- Q1 CTE
/*
WITH cte_name AS (
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name; 
*/
with cte_ex as (
	select gender , max(salary) max_sal , min(salary) min_sal , avg(salary) avg_sal , count(salary) count_the_salary 
    from employee_demographics as d
    join employee_salary as s 
		on d.employee_id=s.employee_id 
	group by gender
) 
select *
from cte_ex  ;

-- Q2 avarage salary by cte
with cte_ex as (
	select gender , max(salary) max_sal , min(salary) min_sal , avg(salary) avg_sal , count(salary) count_the_salary 
    from employee_demographics as d
    join employee_salary as s 
		on d.employee_id=s.employee_id 
	group by gender
) 
select gender , min_sal , max_sal 
from cte_ex  ;

-- Q3 avarage salary by cte+subQuery
SELECT AVG(avg_sal)  
FROM (
    SELECT gender,  
           MAX(salary) AS max_sal,  
           MIN(salary) AS min_sal,  
           AVG(salary) AS avg_sal,  
           COUNT(salary) AS count_the_salary  
    FROM employee_demographics AS d  
    JOIN employee_salary AS s  
        ON d.employee_id = s.employee_id  
    GROUP BY gender
) ex_subQuery; 

-- Q4 multiple cte
/*
WITH cte_name1 AS (
    SELECT column1, column2, ...
    FROM table1
    WHERE condition
),
cte_name2 AS (
    SELECT column1, column2, ...
    FROM table2
    WHERE condition
),
cte_name3 AS (
    SELECT column1, column2, ...
    FROM table3
    WHERE condition
)
SELECT *
FROM cte_name1
JOIN cte_name2
    ON cte_name1.common_column = cte_name2.common_column
JOIN cte_name3
    ON cte_name2.common_column = cte_name3.common_column;
*/
with CTE_ex1 as (
	select employee_id , birth_date , gender
    from employee_demographics 
    where birth_date > '1985-01-01'
) ,
CTE_ex2 as (
	select employee_id , salary
    from employee_salary 
    where salary > 50000
) 
select * 
from CTE_ex1 
join CTE_ex2
	on CTE_ex1.employee_id = CTE_ex2.employee_id  ;
 
-- Q5 
with cte_ex (Gender,SALARY,  Max , Min , AVG_salary , count ) as (
	select gender ,salary , max(salary) max_sal , min(salary) min_sal , avg(salary) avg_sal , count(salary) count_the_salary 
    from employee_demographics as d
    join employee_salary as s 
		on d.employee_id=s.employee_id 
	group by gender , salary
) 
select *
from cte_ex  ;
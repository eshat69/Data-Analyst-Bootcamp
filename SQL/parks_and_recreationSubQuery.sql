/* 1. Subquery in 
SELECT column1, column2
FROM table1
WHERE column1 IN (
    SELECT column1
    FROM table2
    WHERE condition
);
*/
select * from parks_and_recreation.employee_demographics
where employee_id in (
	select employee_id 
    from employee_salary
    where dept_id = 1 
) ;

/* 2. Subquery in SELECT
SELECT column1,
       (SELECT AGGREGATE_FUNCTION(column2)
        FROM table2
        WHERE condition) AS alias_name
FROM table1;
*/ 
select first_name , salary ,(
	select avg(salary) from employee_salary) as avg_salary 
from employee_salary group by first_name, salary ;

/* 3. Subquery in FROM
SELECT sub.column1, sub.column2
FROM (
    SELECT column1, column2
    FROM table1
    WHERE condition
) AS sub;
*/
select gender , avg(age) ,max(age), min(age), count(age)
from employee_demographics 
group by gender ;
select * 
from (
	select gender , avg(age) ,max(age), min(age), count(age)
	from employee_demographics
    group by gender) as agg_table ;
 /*
 select colunm1, aggregate function(column2)
 from table1
 group by column1
 having condition (
	select aggergate function(column2)
    from table1
);
 */   
select dept_id , avg(salary) as avg_salary
from employee_salary
group by dept_id 
having AVG(salary) > (
	select avg(salary)
    from employee_salary) ;
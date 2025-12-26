create temporary table temp_table(
	first_name varchar(50) ,
	last_name varchar(50) ,
    favorite_movie varchar (100)
) ;
SELECT * FROM temp_table ;
insert into temp_table values 
('alex' , 'freberg' , 'loads of the range' ) ,
('eshat' , 'rahman' , 'kantara chap1' ) ;
SELECT * FROM temp_table ;
/*
SELECT column1, column2, AGGREGATE_FUNCTION(column3) AS alias_name
FROM table_name AS t
[JOIN other_table AS o
    ON t.common_column = o.common_column]
WHERE condition
GROUP BY column1, column2
HAVING AGGREGATE_FUNCTION(column3) condition
ORDER BY column_name ASC|DESC
LIMIT number;
*/
select * from employee_salary ;
CREATE TEMPORARY TABLE 50K_up AS
SELECT *
FROM employee_salary
WHERE salary > 49999;
SELECT *
FROM 50K_up;
 
WITH high_salary AS (
    SELECT employee_id, salary
    FROM employee_salary
    WHERE salary > 70000
)
SELECT d.first_name, d.last_name, h.salary
FROM employee_demographics AS d
JOIN high_salary AS h
    ON d.employee_id = h.employee_id;
    
/*
WITH cte_name AS (
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition
)
SELECT main_table.column1, cte_name.column2, ...
FROM other_table AS main_table
JOIN cte_name
    ON main_table.common_column = cte_name.common_column;
*/
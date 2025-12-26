select d.first_name, d.last_name, gender , avg(salary) over(partition by  gender)
from employee_demographics d 
join employee_salary s 
	on d.employee_id=s.employee_id  ;
/*
FUNCTION(column_name) OVER (
    [PARTITION BY column_name]
    [ORDER BY column_name ASC|DESC]
)
*/
select d.employee_id, first_name, d.last_name, gender , salary ,
sum(salary) over(partition by  gender order by d.employee_id) as roling_total
from employee_demographics d 
join employee_salary s 
	on d.employee_id=s.employee_id  ;
 /*
 SELECT 
    t1.column1,
    t1.column2,
    t2.column3,
    -- Simple row numbering
    ROW_NUMBER() OVER () AS row_number_all,
    
    -- Partition by a column (separate groups)
    ROW_NUMBER() OVER (PARTITION BY columnX) AS row_number_partition,
    
    -- Partition + Order (ranking within groups)
    ROW_NUMBER() OVER (PARTITION BY columnX ORDER BY columnY DESC) AS row_number_ordered,
    
    -- Ranking functions
    RANK() OVER (PARTITION BY columnX ORDER BY columnY DESC) AS rank_value,
    DENSE_RANK() OVER (PARTITION BY columnX ORDER BY columnY DESC) AS dense_rank_value
FROM table1 AS t1
JOIN table2 AS t2
    ON t1.common_column = t2.common_column;
 */   
select d.first_name, d.last_name, gender , salary ,
row_number() over()  as row0 ,
row_number() over(partition by gender) as row_par_gen ,
row_number() over(partition by gender order by salary desc) as row_par_sal ,
rank() over(partition by gender order by salary desc) as rank_sal ,
dense_rank() over(partition by gender order by salary desc) as dense_rank_sal
from employee_demographics d 
join employee_salary s 
	on d.employee_id=s.employee_id  ;
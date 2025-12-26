SELECT * FROM parks_and_recreation.employee_demographics;
-- select * means select everything (label/row , feature/column)
-- select feature/col_name for selecting the specific column
-- from database_name.table_name
-- PEMDAS means parenthesis, exponent, multiplication, division, addition, subtraction 
-- Distinct only select unique values
select first_name 
FROM parks_and_recreation.employee_demographics;
select first_name , last_name , birth_date , age , age+10, (age+10)*10
from parks_and_recreation.employee_demographics ;

select gender from parks_and_recreation.employee_demographics ;                            -- entire vatues of gender
select distinct gender from parks_and_recreation.employee_demographics ;                   -- only the unique values of gender
select distinct first_name, gender from parks_and_recreation.employee_demographics ;       -- only unique combination of rowss are selected
select distinct age, gender from parks_and_recreation.employee_demographics ; 
select * from parks_and_recreation.employee_salary;
select * from parks_and_recreation.parks_departments


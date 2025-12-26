-- where clause
/* 
select astric for all feature or col_name for specific column
from database_name.column_name
WHERE condition 
*/

select * from parks_and_recreation.employee_salary       -- select all data from parks_and_recreation database into the employee_salary column
WHERE salary = 50000 ;                                   -- lebel which has  50000 amount of salary
select *
from parks_and_recreation.employee_salary 
where salary > 50000 ;                                   -- label which has more than 50000 amount of salary
select * from employee_salary where salary <=  50000 ;   -- label which has less or equal 50000 amount of salary

select *
from parks_and_recreation.employee_demographics
where gender = 'Female' ;                                 -- gender are only female
select *
from parks_and_recreation.employee_demographics
where gender != 'Female' ;                                -- gender are not female

-- AND OR NOT are 3 logical operators 
select * from parks_and_recreation.employee_demographics 
where birth_date > 1985-01-01 AND age = 'male' ;          -- only male AND after 1085 values are selected [both condition must true]
select * from parks_and_recreation.employee_demographics 
where birth_date > 1985-01-01 OR age = 'male' ;           -- any of either male or after 1985 are selected [any of one condition true]
select * from parks_and_recreation.employee_demographics 
where birth_date > 1985-01-01 OR NOT age = 'male' ;       -- any of either not male/female or after 1985 are selected [any of one condition true]
-- combination of logical operator
select *
from employee_demographics
where (first_name = 'Leslie' AND age = 44) OR age > 55 ;

-- LIKE statement
/* here takes only a specifec pattern not exect match .
   here added special charecter within the LIKE statement
		1st percent Sign % means anything
		last the underscore _  means specifec value with limited charecter
	where column_name LIKE something match is searching for
*/
select * from parks_and_recreation.employee_demographics
where first_name LIKE 'jer%' ;                               -- starts with jer after anything

select * from employee_demographics
where first_name LIKE 'a%' ;                                 --  starts with "a" after anything
select * from employee_demographics
where first_name LIKE 'a___' ;                               -- anything starts with "a" after only 3 charecter
select * from employee_demographics
where first_name LIKE 'a___%' ;                              -- anything starts with "a" after only 3 charecter and than anything after

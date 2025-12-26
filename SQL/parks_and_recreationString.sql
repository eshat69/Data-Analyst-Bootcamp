-- String function  1. length() , 2. upper() , 3, lower() , 
-- 4. trim() , 5. ltrim() , 6. rtrim() , 7. left() , 8. right() , 
-- 9. substring() , 10. replace() , 11. locate() , 12. concat()

select length("Eshat") ;
select first_name , length(first_name) from parks_and_recreation.employee_demographics order by 1 ;
-- length function declared the no of character into the first_name
-- order by is declared the alphabatic indexing of starting 
-- 1 => start with A , 2 +> shart with B , 3=> starts with C and so on
select upper('abGsnjH') ;            -- change all charecter into upper case
select lower('cU8IiJB') ;            -- change all charecter into lower case
SELECT first_name , upper(first_name) from parks_and_recreation.employee_demographics ;
select trim('      rfg     ') ;   
select ltrim('      rfg     ') ;    -- left trim
select rtrim('      rfg     ') ;    -- right trim
select first_name ,
left(first_name , 3) ,             -- 3 is no of charecter from left rand side
right(first_name, 3) ,             -- 3 is no of charecter from right hand side
substring(first_name , 3 ,2 ) ,    -- 3 is no of position of the charecter starts . 2 is the no of character
birth_date ,
substring(birth_date , 6, 2) as birth_month          -- 6 is the starting position . no of value is 2 for selecting month 
from employee_demographics ; 
select first_name , replace(first_name, "a" , "z")   -- first name's all small charecter 'a'replaced with 'z'
from parks_and_recreation.employee_demographics ;
select locate('h','Eshat') ;                         -- locate find the no of position h => locat in Eshat
select first_name, locate('a' , first_name)          -- find the no of position 'a' is in the first_name 
from employee_demographics ;
select first_name, last_name ,       
concat(first_name ," ", last_name) as full_name      -- cancat the first_name and last_name as full_name
from employee_demographics ;

-- structure 
/* 
-- LENGTH(): counts number of characters
SELECT LENGTH(column_name)
FROM table_name;

-- UPPER(): converts to uppercase
SELECT UPPER(column_name)
FROM table_name;

-- LOWER(): converts to lowercase
SELECT LOWER(column_name)
FROM table_name;

-- TRIM(): removes spaces from both sides
SELECT TRIM(column_name)
FROM table_name;

-- LTRIM(): removes spaces from left side
SELECT LTRIM(column_name)
FROM table_name;

-- RTRIM(): removes spaces from right side
SELECT RTRIM(column_name)
FROM table_name;

-- LEFT(): extracts n characters from left
SELECT LEFT(column_name, n)
FROM table_name;

-- RIGHT(): extracts n characters from right
SELECT RIGHT(column_name, n)
FROM table_name;

-- SUBSTRING(): extracts part of string
SELECT SUBSTRING(column_name, start_position, length)
FROM table_name;

-- REPLACE(): replaces substring with another
SELECT REPLACE(column_name, 'old_text', 'new_text')
FROM table_name;

-- LOCATE(): finds position of substring
SELECT LOCATE('substring', column_name)
FROM table_name;

-- CONCAT(): joins multiple strings
SELECT CONCAT(column1, ' ', column2) AS new_column
FROM table_name;
*/
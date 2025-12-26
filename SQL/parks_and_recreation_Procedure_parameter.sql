select * from employee_salary where salary >= 50000 ;
select * from employee_salary where salary <= 50000 ;
-- Procedure1 
-- A stored procedure is a named block of SQL code saved in the database.
-- It can accept parameters (IN, OUT, INOUT) and return results.
-- Useful for business logic, data validation, and batch operations.
-- Stored in the schema like tables, indexes, and triggers.


create procedure  large_salary ()
select * 
from employee_salary 
where salary >= 50000 ;
call large_salary()
;
-- Procedure2 
delimiter $$
create procedure  large_salary2()
begin
	select * 
	from employee_salary 
	where salary >= 50000 ;
	select * 
	from employee_salary 
	where salary >= 50000 ;
end $$
delimiter ;
-- Procedure3 
/*
		DELIMITER $$
		CREATE PROCEDURE procedure_name (IN param1 INT, OUT param2 VARCHAR(50))
		BEGIN
			-- SQL statements go here
			SELECT column_name INTO param2
			FROM table_name
			WHERE id = param1;
		END$$
		DELIMITER ;
	CALL procedure_name(123, @output_value);
	SELECT @output_value;
- DELIMITER $$ → changes the statement delimiter so MySQL doesn’t stop at ; inside the procedure.
- CREATE PROCEDURE procedure_name (...) → defines the procedure.
- IN → input parameter.
- OUT → output parameter.
- INOUT → can be both input and output.
- BEGIN ... END → procedure body.
*/
delimiter $$
create procedure  large_salary3()
begin
	select * 
	from employee_salary 
	where salary < 50000 ;
	select * 
	from employee_salary 
	where salary >= 50000 ;
end $$
delimiter ;
call large_salary3() ;

-- parameter 
DELIMITER $$
CREATE PROCEDURE large_salary4(IN parameter_e_id INT)
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id = parameter_e_id;
END$$
DELIMITER ;
-- Call the procedure
CALL large_salary4(1);
; 
DELIMITER $$
CREATE PROCEDURE GetEmployeeByDept(IN p_dept INT)
BEGIN
    SELECT first_name, last_name, salary
    FROM employee_salary
    WHERE dept_id = p_dept;
END$$
DELIMITER ;
-- Call it
CALL GetEmployeeByDept(3);
-- List procedures:
-- SHOW PROCEDURE STATUS WHERE Db = 'database_name';
-- View definition
-- SHOW CREATE PROCEDURE procedure_name;
-- Drop procedure:
-- DROP PROCEDURE IF EXISTS procedure_name;

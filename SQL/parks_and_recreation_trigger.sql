select * from parks_and_recreation.employee_demographics ;
select * from employee_salary ;
/*
A trigger is a named database object associated
with a table that activates automatically 
when a specific event occurs (insert, update, delete)
DELIMITER $$
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON table_name
FOR EACH ROW
BEGIN
    -- SQL statements go here
    -- You can reference OLD.column_name and NEW.column_name
END$$
DELIMITER ;
*/
delimiter  $$
create trigger employee_insert
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics(employee_id , first_name , last_name) 
    values (new.employee_id,new.first_name , new.last_name ) ;
end $$
delimiter ; 
INSERT INTO employee_salary(employee_id , first_name , last_name , occupation , salary, dept_id)
values (31, 'eshat','rahman' , 'emtertain of CEO' , 1000000, null ) ;
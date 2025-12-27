-- An event in MySQL is a scheduled task managed by the Event Scheduler.
-- It allows you to run SQL statements automatically at a specific time or at regular intervals.
-- Think of it like a cron job inside MySQL.
/*
CREATE EVENT event_name
ON SCHEDULE AT TIMESTAMP 'YYYY-MM-DD HH:MM:SS'
DO
    SQL_statement;
SET GLOBAL event_scheduler = ON;
SHOW EVENTS;
DROP EVENT IF EXISTS event_name;
*/
select * from paremployee_demographics ;
delimiter $$
create event retires                       -- defines the event
on schedule every 30 second                -- runs repeatedly every 30 seconds.
do                           v             -- followed by the SQL statement(s).
begin
	delete
	select * from employee_demographics
    where age >= 60 ;
end
delimiter ; 
show variables ;                              --  list all events.
show variables like 'event%' ; 
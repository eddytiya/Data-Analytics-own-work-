insert into science_class values
(1,'popeye',33),
(2,'olive',54),
(3,'brutus',98);

copy science_class from 'C:\Program Files\PostgreSQL\16\data/student.csv' delimiter ','csv header;

select * from science_class

select name from science_class where science_marks>60;

select name,science_marks from science_class where science_marks>35 and science_marks<60;

select name,science_marks from science_class where science_marks<=35 or science_marks>60;



select * from science_class

update science_class 
set science_marks=45 
where name='popeye';

select * from science_class;

delete from science_class 
where name ='Robb';


select * from science_class;


alter table science_class
Rename column name to student_name;
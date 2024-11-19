insert into customer_table values
(1,'bee','tee',32,'bt@xyz.in');


insert into customer_table (cust_id,first_name,age,email_id) values
(2,'deedee',23,'deedee@gmail.com');

insert into customer_table values
(3,'aditya','pathak',21,'adipat@gmail.com'),
(4,'saiyam','gandhi',21,'saigand@gmail.com'),
(5,'kishan','vishwakarma',21,'kishanvishwa@gmail.com'),
(6,'virat','kohli',35,'vk18@gmail.com');


copy customer_table from 'C:\Program Files\PostgreSQL\16\data/datacp.csv' delimiter ',' csv header;


copy customer_table from 'C:\Program Files\PostgreSQL\16\data/datatext.txt' delimiter ',';

select first_name from customer_table;

select first_name,last_name from customer_table;
select * from customer_table;



select distinct first_name from customer_table;


select distinct first_name,age from customer_table;

select distinct * from customer_table;

select first_name from customer_table where age=21;

select distinct first_name from customer_table where age>21;

select * from customer_table where first_name= 'deedee';

select first_name,last_name,age from customer_table where age>=21 and age<34;

select first_name,last_name,age from customer_table where age<21 OR age>25;

select first_name,last_name,age from customer_table where NOT age=21;

select first_name,last_name,age from customer_table where NOT age=21 and not first_name='deedee' ;

select first_name,last_name,age from customer_table where cust_id=2;

update customer_table
set last_name='cockroach',age=17 where cust_id=2;

select * from customer_table;

update customer_table
set email_id='cockroach@im.com',age=17 where first_name='deedee' or first_name='bee';

select * from customer_table;

delete from customer_table
where cust_id=6;

select * from customer_table;


delete from customer_table
where age<21;

select * from customer_table;

delete from customer_table;

select * from customer_table;





select * from customer_table;
alter table customer_table add test varchar(255);
select * from customer_table;



alter table customer_table drop test;
select * from customer_table;


//changinf the dtype of age column from int to char

alter table customer_table alter column age type varchar(255);
select * from customer_table;


//renaming a column

alter table customer_table RENAME column email_id to customer_email;
select * from customer_table;



//adding or deleting a constraint

alter table customer_table alter column cust_id set NOT NULL;

//inserting values where cust id is missing

insert into customer_table(first_name,last_name,age,customer_email)
values('aditya','pathak',21,'987@hotlook.com');

//dropping constraints
alter table customer_table alter column cust_id drop NOT NULL;
insert into customer_table(first_name,last_name,age,customer_email)
values('aditya','pathak',21,'987@hotlook.com');
select * from customer_table;



//stating that the constraint should start from 1

alter table customer_table add constraint cust_id check(cust_id>0);
insert into customer_table(cust_id,first_name,last_name,age,customer_email)
values(0,'aditya','pathak',21,'987@hotlook.com');
select * from customer_table;


insert into customer_table(cust_id,first_name,last_name,age,customer_email)
values(2,'aditya','pathak',21,'987@hotlook.com');
select * from customer_table;



'''adding a primarykey and foreign key constraint'''

alter table customer_table add primary key (cust_id);

delete from customer_table ;


insert into customer_table(cust_id,first_name,last_name,age,customer_email)
values(1,'aditya','pathak',21,'987@hotlook.com');
select * from customer_table;



'''adding a primarykey and foreign key constraint'''

alter table customer_table add primary key (cust_id);
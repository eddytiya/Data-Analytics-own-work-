#question 1

create table tweets(
username varchar(15),
tweetcontent varchar(140),
favourites int
);

INSERT INTO tweets (username, tweetcontent, favourites) VALUES
('user1', 'Just had an amazing coffee! #morningvibes', 25),
('user2', 'Excited for the weekend! Any plans? #TGIF', 40),
('user3', 'Learning SQL is fun! #codinglife', 15);

select * from tweets;

#question2

create table pastries(
name varchar(50),
quantity int	);

show tables;

desc pastries;
drop table pastries;

#question3

create table people(
first_name varchar(20),
last_name varchar(20),
age int
);

insert into people 
VALUES('lional','messi',37);

insert into people 
VALUES
('erling','haaland',23),
('jude','bellingham',22),
('jamine','yamal',17)
;

select * from people;

drop table people;

-- question 4:Create Table/ Insert Exercise

CREATE TABLE employee(
id INT auto_increment primary key,
last_name varchar(100) NOT NULL,
first_name varchar(100) not null,
middle_name varchar(100),
age int NOT NULL,
current_status varchar(100) NOT NULL DEFAULT 'employed'
);

DESC employee;

INSERT INTO employee(first_name,last_name,age)
VALUES('aditya','pathak',21);

INSERT INTO employee(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);


select * from employee


show tables;
drop table cats;


-- question5:rapid fir write the query for the output
select * from cats
select cat_id from cats;
select name,breed from cats;
select name,age from cats where breed='Tabby';
select cat_id,age from cats where cat_id=age;


-- question6
select * from cats

update cats
set name ='Jack'
Where name='Jackson';

update cats
set breed ='British shorthair'
Where name='Ringo';

update cats
set age =12
Where name='Maine Coon';

#4.DELETE
select * from cats;

DELETE FROM cats WHERE name='Egg';


-- question7
select * from cats

delete from cats
where age='4';

delete from cats
where age=cat_id;

delete from cats;
#one to many relationship
show databases;
create database shop;

use shop
CREATE TABLE customers(
	id int primary key auto_increment,
    first_name varchar(50),
	last_name varchar(50),
    email varchar(50)
);

-- >using foreign key constraint to link 2 tables

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	amount DECIMAL(8,2),
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(id)
);

DESC orders
desc customers

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       

       
select * from orders;
select * from customers;


-- simple regular to get info in people with customer id 1
select * from orders 
where customer_id=(select id from customers where last_name='george')

-- we can use joins for that
-- > 1.CROSS JOINS

select * from customers,orders;

-- >2. INNER JOINS

select * from customers
join orders  
on customers.id=orders.id;


select first_name,last_name,order_date
from customers
join orders  
on customers.id=orders.id;

select * from orders 
join customers
on orders.id=customers.id

-- >inner join with group by
select first_name,last_name,sum(amount) as total
from customers
join orders  
on customers.id=orders.id
group by first_name,last_name
order by total;

select * from customers;
select * from orders;

-- >3.LEFT JOIN
select first_name,last_name,order_date,amount
from customers
LEFT JOIN orders 
ON orders.customer_id=customers.id  ;

-- using IfNULL()
select first_name,last_name,ifnull(sum(amount),0) as MONEY_SPENT
from customers
LEFT JOIN orders 
ON orders.customer_id=customers.id
group by first_name,last_name;

#4.RIGHT JOIN
select first_name,last_name,order_date
from customers
right JOIN orders 
ON orders.customer_id=customers.id;

insert into orders (amount,order_date)
values(100,curdate());

select * from orders;

select first_name,last_name,order_date,amount 
from customers
right join orders 
ON customers.id=orders.customer_id;

drop table orders,customers

-- > ON DELETE CASCADE

CREATE TABLE customers(
	id int primary key auto_increment,
    first_name varchar(50),
	last_name varchar(50),
    email varchar(50)
);

CREATE TABLE orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	amount DECIMAL(8,2),
	customer_id INT,
	FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);


DESC orders;
desc customers;

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);


SET SQL_SAFE_UPDATES = 0;


delete from customers where last_name='george';


#exercise

CREATE TABLE students(
id int primary key auto_increment ,
first_name varchar(100)
);

CREATE TABLE papers (
title varchar (100) ,
grade INT,
student_id int,
foreign key (student_id) references students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from students;
select * from papers;

select first_name,title,grade
from students
right join papers
ON papers.student_id=students.id
order by grade DESC;

select first_name,
ifnull(title,'missing'),
ifnull(grade,'missing)')
from students
left join papers
ON papers.student_id=students.id
order by grade DESC;

select first_name,
ifnull(avg(grade),0) as avg
from students
left join papers
on papers.student_id=students.id
group by first_name
order by avg desc;

select first_name,
ifnull(avg(grade),0) as average,
case
   when ifnull(avg(grade),0) >=75 then 'PASSING'
   ELSE 'FAILING'
end AS PASSING_STATUS
from students
left join papers
on papers.student_id=students.id
group by first_name
order by average desc;











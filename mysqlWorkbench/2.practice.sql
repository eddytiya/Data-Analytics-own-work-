create database new;
use new;

CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);
 
CREATE TABLE dogs (
    name VARCHAR(50),
    breed VARCHAR(50),
    age INT
);

show databases;
show tables;
SHOW COLUMNS FROM cats;
DESC cats;

-- dropping tables
DROP TABLE cats;

/*4.INSERTING DATA*/
-- RECREATE THE TABLE

CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);

INSERT INTO cats (name, age) 
VALUES ('Blue Steele', 5);

INSERT INTO cats (name, age) 
VALUES ('Jenkins', 7);

SELECT * FROM cats;
INSERT INTO cats (age, name) 
VALUES 
  (2, 'Beth');

-- multi inserts

INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5), 
  ('Turkey', 1), 
  ('Potato Face', 15);

select * from cats;



-- null values
INSERT INTO cats (name) 
VALUES ('TODD');

INSERT INTO cats () 
VALUES ();

-- we use NOT NULL if WE dont want null values while defining the table
CREATE TABLE cats2(
name VARCHAR(50) NOT NULL,
AGE INT NOT NULL
);

DESC cats2;

-- DEFAULT
CREATE TABLE cats3(	
name VARCHAR(50) default 'unnamed',
AGE INT default 99
);

desc cats3;
select * from cats3;


INSERT INTO cats3(age) VALUES(13);
INSERT INTO cats3() VALUES();

-- combine not null and default

CREATE TABLE cats4  (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);
INSERT INTO cats4() VALUES();
SELECT * FROM cats4;



-- NULL VALUES
CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

drop table unique_cats;

CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) ,
    age INT 
);

-- AUTO_INCREMENT
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);

insert into unique_cats3(name,age) values('pepper',7);
insert into unique_cats3(name,age) values('pepper',7);
insert into unique_cats3(name,age) values('pepper',7);

select * from unique_cats3;

--

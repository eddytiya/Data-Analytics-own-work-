#more constraints
-- 1.unique constraints

use books;

CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
 
 select * from contacts;
 
-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455'); 

#2check constraint
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

select * from users
insert into users 
values('adifii',50);
 
 -- error stmt
 insert into users 
values('unknown',-8);
 
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
)
insert into palindromes
values('racecar');

insert into palindromes
values('paliendromes');


#3.named constraints
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

#4.multiple column constraints
 
create table companies(
name varchar(255) not null,
address varchar(255) not null,
CONSTRAINT named_address UNIQUE(name,address)
);


insert into companies
values('black bird','nottingham')

insert into companies
values('black','nottingham')

create table houses(
purchase_price INT not NULL,
sale_price INT NOT NULL,
CONSTRAINT SP_GT_PP check(sale_price>=purchase_price)
);

insert into houses
values(100,200);

-- error stmt
insert into houses
values(100,50);


#############ALTER TABLE:https://dev.mysql.com/doc/refman/8.4/en/alter-table.html

-- >ADDING A NEW COLUMN INTO AN EXISTING TABLE
alter table companies
add column phone_no varchar(15);

select * from companies;

alter table companies
add column employee_count INT NOT NULL;

ALTER TABLE companies
ADD COLUMN employee_counts INT NOT NULL DEFAULT 1;

-- > dropping columns
alter table companies
drop column employee_count ;

alter table companies
drop column employee_counts ;

alter table companies
drop column phone_no ;

select * from companies;

-- >renaming
#way1
RENAME TABLE companies to suppliers

select * from suppliers
#way2
alter table suppliers
RENAME to companies;

select * from companies

-- .rename a column
desc companies

alter table companies
rename column name to company_name

-- modify
ALTER TABLE companies
MODIFY company_name varchar(100) default 'UNKNOWN';

-- > altering constraints
alter table houses 
add constraint positive_price check(purchase_price>=0)

desc houses;
-- error stmt
insert into houses 
values(-1,4)
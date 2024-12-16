CREATE DATABASE BOOKS;
USE BOOKS;

CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
    
    INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;

-- 1.CONCAT
SELECT CONCAT('pi', 'ckle');

SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;

SELECT CONCAT_WS('-',title, author_fname, author_lname) AS DETAILS FROM books;

-- 2.SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

select substr(author_fname,1,1),author_fname AS 'initials' from books;



-- Combining String Functions
select 
concat(substr(title,1,10),'...') as 'title' 
			from books;
            
select 
author_fname,
author_lname,
concat(SUBSTR(author_fname,1,1),'.',SUBSTR(author_lname,1,1),'.') AS author_initials 
from books;       

-- 4.replace
SELECT REPLACE('Hello World', 'Hell', '%$#@');

SELECT REPLACE('Hello World', 'l', '7');

SELECT REPLACE('Hello World', 'o', '0');

SELECT REPLACE('HellO World', 'o', '*');

SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');
  
SELECT REPLACE(title, 'e ', '3') FROM books;

select REPLACE (title , ' ','-') from books;

-- 5.reverse
SELECT REVERSE('heLLO WORLD');

SELECT author_fname,REVERSE (author_fname) from books;
     
 SELECT concat(author_fname,REVERSE (author_fname)) from books;
 
 -- 6.char_length
select char_length('hello world');

select char_length(title) AS length,title from books;   

SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;

-- 7.upper and lower 

select title,UPPER(title),lower(title) from books ;

SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;



-- 8. more


SELECT INSERT('Hello Bobby', 6, 0, 'There'); 
 
SELECT LEFT('omghahalol!', 3);
 
SELECT RIGHT('omghahalol!', 4);
 
SELECT REPEAT('ha', 4);
 
SELECT TRIM('  pickle  ');     

#######exercise

select REVERSE(UPPER('Why does my cat look at me with such hatred?'))

select * from books;

select REPLACE(title,' ','->') AS title from books;

select author_lname As forwards,REVERSE(author_lname) As backwards from books;

select UPPER(concat(author_fname,' ',author_lname)) AS 'fullname in caps' from books;

select concat(title,'was released in',released_year) from books; 

select title,char_length(title) as 'character count' from books;

select 
    concat(substr(title,1,10),'...')AS 'short title',
    concat(author_lname,',',author_fname)AS 'author',
    concat(stock_quantity,' in stock') as quantity
 from books;
 
 
 
 ######################################################################refining selections################################################################3
 -- more selection options
 INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
-- 1.DISTINCT 

select * from books;

select distinct(author_fname) from books;
select released_year from books;
select distinct(released_year) from books;

/*distinct full names*/
select author_fname,author_lname from books;
select Distinct(concat(author_fname,' ',author_lname)) from books;

select Distinct author_fname,author_lname,released_year from books;

-- 2.ORDER BY

select book_id,author_fname,author_lname 
from books
ORDER BY author_lname;

/*ASC and DESC*/
select book_id,author_fname,author_lname 
from books
ORDER BY author_fname desc ;  

select title,pages,released_year 
from books 
order by released_year ASC;   

select title,author_fname,author_lname,pages 
from books 
order by 2 desc;  
    
select title,author_fname,author_lname,pages 
from books 
order by 2 desc;  
  
select author_lname,released_year,title
from books 
order by 1,2 ;  
  
select author_lname,released_year,title
from books 
order by author_lname,released_year desc; 


SELECT CONCAT(author_fname,' ',author_lname) as author
from books
order by author;

-- 3.LIMIT
select book_id,title,released_year FROM books
LIMIT 5;

select book_id,title,released_year FROM books
order by released_year limit 5;

select book_id,title,released_year FROM books
order by released_year DESC limit 5;

select book_id,title,released_year FROM books
order by released_year limit 0,5;

select book_id,title,released_year FROM books
order by released_year limit 5,7;

select title from books order by title limit 100;

-- 4.LIKE
select title,author_fname,author_lname from books
WHERE author_fname LIKE '%da%';

select * from books 
where title LIKE '%:%';

/*if u want to find authors with only 4 char in length*/
select * from books
where author_fname LIKE '____';

select title,author_fname,author_lname from books
WHERE author_fname LIKE '%n';

select * from books 
where title LIKE '%\%%';

-- To select books with an underscore '_' in title:
SELECT * FROM books
WHERE title LIKE '%\_%';




-- ---- exercise
select * from books;

select title from books where title LIKE '%stories%';

select title,pages from books 
order by pages desc LIMIT 1;

select title,pages from books 
where title like '%The Amazing Adventures of Kavalier & Clay%' ;

select concat(title,' - ',released_year) AS summary
from books
order by released_year DESC LIMIT 3;

select title,author_lname
from books
where author_lname LIKE '% %';

select title,released_year,stock_quantity
from books
order by stock_quantity asc,released_year desc limit 3;


select title,author_lname from books
order by author_lname ,title;

select concat('MY FAVOURITE AUTHOR IS ',author_lname,' !') as yell
from books order by yell;

######################################################aggregate functions############################################################
-- 1.COUNT
select count(*) from books;

/*DISTINCT AUTHOR FNAMES*/

select count(distinct(author_fname)) from books;

select count(distinct(released_year)) from books;

select count(distinct(author_lname)) from books;

select count(distinct(author_fname)) from books;

-- suppose u want to count the number of counts of 
-- books which contain the text'THE'

SELECT title from books WHERE title LIKE '%the%';

SELECT count(title) from books WHERE title LIKE '%the%';


-- 2.GROUP BY:combines identical data into single row

select author_lname,COUNT(*) as count 
from books
GROUP BY author_lname 
order by count DESC;

select released_year,COUNT(*) as count 
from books
GROUP BY released_year 
order by count DESC;

-- 3. min and max
SELECT MIN(released_year) from books;

SELECT MIN(author_lname),MAX(author_lname) from books;


--supose u want to ind the title of the longest book
select MAX(pages) from books;

#select MAX(pages),title from books; this will throw an error

select title,pages from books order by pages DESC limit 1;

-- 4.SUBQUERIES

select title,pages from books
where pages=(select max(pages) from books); 

insert into books(title,pages) 
VALUES('my life in words',634);

select title,pages from books
where pages=(select max(pages) from books); 

select min(released_year) from books;

select title,released_year from books
where released_year = (SELECT MIN(released_year) from books);


-- group by a little more

select author_fname,author_lname from books;
/*u can see author lname harris shows up twice so if we count them*/
select author_lname,count(*) from books group by author_lname;
/*when we grup by only lname harris is shown 2
but when we grup by with lname ,fname it will be partioned by 1,1 easch due to different fnames*/

select author_lname,count(*) from books group by author_lname,author_fname;

select author_fname,author_lname,count(*) from books group by author_lname,author_fname;

select CONCAT(author_fname,' ',author_lname) as AUTHOR,count(*)
 from books 
 group by AUTHOR;
 
-- min and max with group by

select * from books;

select concat(author_fname,' ',author_lname)AS author,
min(released_year) from books 
group by author ;

select concat(author_fname,' ',author_lname)AS author,
max(released_year) from books 
group by author ;

select concat(author_fname,' ',author_lname)AS author,
min(released_year),max(released_year) from books 
group by author ;


select concat(author_fname,' ',author_lname)AS author, 
count(*) AS books_written,
min(released_year)AS earliest_release,
max(released_year)AS latest_release,
max(pages)AS length_of_books 
from books 
group by author ;


-- 4.SUM()

select SUM(pages) from books;

select author_lname,
sum(pages) 
from books
GROUP BY author_lname;

/*no rational sense of below cmd*/
select author_lname,
count(*),
sum(released_year)
from books
group by author_lname;

-- 5.AVG

SELECT AVG(released_year) from books;

SELECT AVG(pages) from books;

select avg(stock_quantity),released_year,count(*) from books
group by released_year;

##########################practice

select * from books

select count(title) from books;

select released_year,count(*) AS book_released from books
group by released_year;

select sum(stock_quantity) from books;

select concat(author_fname,' ',author_lname) AS author,
avg(released_year)
from books
group by author;

select concat(author_fname,' ',author_lname) AS author,
max(pages)AS pages
from books
group by author
order by pages DESC 
limit 2;
/*OR*/
select CONCAT(author_fname,' ',author_lname) AS author,pages from books
where pages = (select max(pages) from books);

select released_year AS year,
count(*) as '# books',
avg(pages) as AVG_PAGES
from books
group by released_year
order by year;
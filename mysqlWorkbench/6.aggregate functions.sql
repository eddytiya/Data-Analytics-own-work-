/*Aggregate functions*/
USE BOOKS;

select * from books;

#1.count
SELECT count(*) from books;
SELECT count(author_fname) from books;
SELECT count(distinct(author_fname)) from books;

SELECT count(distinct(author_lname)) from books;


select count(released_year) from books;
select count(distinct(released_year)) from books;

select title from books where title LIKE '%the%';
select count(title) from books where title LIKE '%the%';

#2.GROUP BY

select author_lname from books
group by author_lname;

/*how many books each author has written*/

select concat(author_fname,' ',author_lname) as author,
count(title) AS number
from books
group by author
order by number desc;

/*number of books released each year*/
select count(title),released_year from books
group by released_year;

#3.min and max

select min(released_year),max(released_year) from books;

select max(pages) from books;

select min(author_lname),max(author_lname) from books;

/*what if i wanted to know the tite of the longest book*/

select title,max(pages) as pages from books
group by title 
order by pages desc
limit 1;

#OR we can use subqueries

select title,pages from books
where pages= (select max(pages) from books) limit 1;

/*select title of book which was released earliest*/

select title as heading,
min(released_year) as years from books
group by heading
order by years asc
limit 1;

-- difference in useing subqueries is theat there will be no null values
select title,released_year from books
where released_year=(select min(released_year) from books)

select concat(author_fname,' ',author_lname) as author,
count(*) 
from books
group by author 
order by author desc;


select concat(author_fname,' ',author_lname) as author,
count(title) as books_writter,
min(released_year) as earliest,
max(released_year) as latest,
max(pages) as page_count
from books
group by author 

select concat(author_fname,' ',author_lname) as author,
count(pages)
from books
group by author;

#4.SUM

select sum(pages) from books;

select author_lname,sum(pages) from books group by author_lname

select author_lname,count(*) ,sum(released_year) from books group by author_lname

#5.AVG
select avg(released_year) from books;

select avg(pages) from books;

select avg(stock_quantity) from books;

select released_year,avg(stock_quantity),count(*) from books
group by released_year;

#exercise

select count(title) from books;

select released_year,count(title) as 'number of books' from books
group by released_year

select sum(stock_quantity) from books
group_by title;

select concat(author_fname,' ',author_lname) as author,
avg(released_year)from books
group by author;

select concat(author_fname,' ',author_lname) as author,
max(pages) as page
from books
group by author
order by page desc
limit 1 ;

#or

select concat(author_fname,' ',author_lname) as author,
pages as page
from books
where pages=(select max(pages) from books)
limit 1;

select released_year as year,
count(title) as '# books',
avg(pages) as 'avg pages'
from books
group by year
order by year ;
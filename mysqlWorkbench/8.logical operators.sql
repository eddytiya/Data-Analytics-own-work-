use books

#not equal()!=
select * from books where released_year!=2017

select title,author_lname from books
where author_lname!='Gaiman';

#2.NOT LIKE
select title from books
where title NOT like '% %'

select title,author_fname,author_lname from books 
where author_fname not like 'da%'

select title from books 
where title not like '%e%';

#greater than >

select * from books 
where released_year>2000

select * from books where pages>500

select 99>1;-- gives a boolean value

select title,pages,released_year from books where pages>400;

#4.less than /equal to

select title,released_year from books where released_year<2000;

select title,released_year from books where released_year>=2000;


## 5.&& and operator

select * from books 
where author_lname='eggers' AND released_year >2010

select title,released_year from books 
where author_lname='eggers' AND title like '%novel%'

select title,pages from books
where char_length(title)>30 and pages>500;


select char_leangth(title),released_year from books 
where author_lname='eggers' AND title like '%novel%'


## 6.logical OR

select * from books 
where author_lname='eggers' OR released_year >2010

select title,pages from books
where pages<200 OR 
title like '%stories%'

##7.between

-- without between
select title,released_year from books
where released_year>=2004 AND
released_year<-2015

select title,released_year from books
where released_year between 2004 AND 2015
order by released_year 

select title,pages from books
where pages BETWEEN 200 and 300;

select title,pages from books
where pages not BETWEEN 200 and 300;

#comparing dates
use mysql

select * from peoplee 
where birthdate < '2005-01-01'

select * from peoplee 
where hour(birthdate) < '09:00:00'

select CAST('09:00:00' AS TIME) 

-- preffered option
select * from peoplee 
where hour(birthtime) between '09:00:00' AND '11:00:00'

-- can also use this 
select * from peoplee 
where birthtime between CAST('09:00:00' AS TIME)  
AND CAST('11:00:00' AS TIME)

## 8.IN operator
use books

-- without in
select title ,author_lname from books
where author_lname='carver'
OR author_lname='Lahiri'
OR author_lname='Smith';

-- with IN
select title ,author_lname from books
where author_lname IN('carver','Lahiri','Smith');

-- NOT IN
select title ,author_lname from books
where author_lname NOT IN('carver','Lahiri','Smith');

select title ,author_lname from books
where released_year 
not IN(2000,2002,2004,2006,2008,2010,2012,2014,2016);

select title ,author_lname from books
where released_year>=200
AND released_year  
not IN(2000,2002,2004,2006,2008,2010,2012,2014,2016);

-- we can also use modulo% operator

select title,released_year from books
where released_year >=2000 AND
released_year % 2 != 0;

## 9.CASE statements

select title,released_year,
	case
		when released_year>=2000 then 'modern-littt'
        else '20th century litt'
    END AS 'genre'    
from books    

select title,stock_quantity,
	case
		when stock_quantity BETWEEN 0 and 40 then '*'
        WHEN stock_quantity between 41 and 70 then '**'
        WHEN stock_quantity between 71 and 100 then '***'
        WHEN stock_quantity between 50 and 100 then '****'        
        else '*****'
	end AS Stock
from books

## 10.IS NULL

select * from books where author_lname IS NULL;
select * from books where title IS NULL;

SET SQL_SAFE_UPDATES = 0;

delete from books where title IS NULL;

delete from books where author_lname IS NULL;

#exercise
select title,released_year
from books 
where released_year<1980

SELECT title, released_year, author_lname
FROM books
WHERE author_lname = 'eggers'
 OR author_lname = 'chabon';
 
 SELECT title, released_year, author_lname
FROM books
WHERE author_lname = 'Lahiri'
and released_year > 2000;

select * from books where pages between 100 and 200

select * from books
where author_lname like'c%' OR author_lname like's%'


select title,author_lname,
case
when title like '%stories%' then 'short stories'
when title= 'just kids' OR title='A Heartbreaking Work of Staggering Genius' then 'memor'
else 'novel'
end as genre
from books

select * from books



select author_fname,author_lname,concat(count(title), ' books')
from books
group by author_fname,author_lname 

select author_fname,author_lname,count(title),
case 
when count(*) = 1 then '1 book'
else concat(count(*),' books')
end as count
from books
group by author_fname,author_lname
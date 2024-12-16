use tv_db;

#view
select title,released_year,rating,concat(first_name,' ',last_name) as reviewer from reviews
join series
on reviews.series_id=series.id
join reviewers 
on reviews.reviewer_id=reviewers.id;

create view full_reviews AS
select title,released_year,genre,rating,concat(first_name,' ',last_name) as reviewer from reviews
join series
on reviews.series_id=series.id
join reviewers 
on reviews.reviewer_id=reviewers.id;

show tables;

select * from full_reviews
where rating >8.0;

select reviewer,avg(rating) from full_reviews
group by reviewer;

-- >to delete somthing from view:not all views can be updated or deleted
create view  ordered_series as
select * from series order by released_year;

insert into ordered_series(title,released_year,genre)
values('witcher',2020,'horror')

select * from ordered_series order by id;

delete from ordered_Series where title ='witcher'

set sql_safe_updates=0;

-- > create or replace views

create or replace view ordered_series AS
select * from series order by released_year;

## 2.having clause on group by

select * from full_reviews;

select title,avg(rating) 
from full_reviews 
group by title;

select title,avg(rating),count(rating) 
from full_reviews 
group by title having count(rating)>1;
#3.ROLLUP

select title,avg(rating)
from full_reviews 
group by title ;

select title,avg(rating)
from full_reviews 
group by title with rollup;

select released_year,genre,avg(rating)
from full_reviews 
group by released_year,genre with rollup;

# 5.sql modes

-- viewing modes

select @@GLOBAL.SQL_MODE;
select @@LOCAL.SQL_MODE;

-- CHANGING THE MODE
select @@SESSION.SQL_MODE;

SET SESSION SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

SHOW WARNINGS;

SELECT 3/0;

-- STRICT TRANS TABLE(HOW SQL DEALS WITH MISSING VALUES)

select @@GLOBAL.SQL_MODE;

DESC reviews;
insert into reviews(rating) values ('hi');
/* but if we trun tha tsetting off we can do it*/
SET SESSION SQL_MODE='';
-- WE DIDNT GET ERROR BUT AN WARNING
insert into reviews(rating) values ('hi');

SET SESSION SQL_MODE='STRICT_TRANS_TABLES';
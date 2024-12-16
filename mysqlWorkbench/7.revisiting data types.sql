show databases;
use mysql
/* documentation
https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html
*/
#date and time

CREATE TABLE peoplee (
name varchar(100),
birthdate DATE,
birthtime TIME,
birthdt DATETIME
);

desc peoplee

insert into peoplee(name,birthdate,birthtime,birthdt)
values('ellyse perry','2000-12-25','10:03:45','2000-12-25 10:03:45');

insert into peoplee(name,birthdate,birthtime,birthdt)
values('smriti mandhana','1996-08-25','09:45:45','1996-08-25 09:45:45');

INSERT INTO peoplee (name, birthdate, birthtime, birthdt)
VALUES ('shreyanka patil', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');

select * from peoplee



#########current datte,time and now

select curdate();
select curtime();
select now();

INSERT INTO peoplee (name, birthdate, birthtime, birthdt)
VALUES ('harmanpreet kaur', CURDATE(), CURTIME(), NOW());


SELECT birthdate FROM peoplee;

-- > date functions
SELECT birthdate,
day(birthdate),
dayofweek(birthdate),
dayofyear(birthdate)
 FROM peoplee;
 
 select birthdate,
 monthname(birthdate),
 from peoplee
 
select name,birthdate,
monthname(birthdate),
from peoplee
 
select name,birthdt,
 year(birthdt),
 monthname(birthdt)
 from peoplee
 
 -- > time func
 
select name,birthdt,
MINUTE(birthdt),
HOUR(birthdt),
DATE(birthdt),
time(birthdt)
from peoplee;

-- > FORMATTING DATES
# SUPPOSE U WANT DATE IN THIS FORMAT:'APRIL 11 1985'
SELECT concat(MONTHNAME(birthdate),' ',DAY(birthdate),' ',YEAR(birthdate))
from peoplee;

-- or we can use format strings(u can refer documentation)
-- > specifiers
select date_format(birthdate,'%b') from peoplee;

select date_format(birthdate,'%a %b %e %D') 
from peoplee;

select birthdt,date_format(birthdt,'%H %i') from peoplee;

select birthdt,date_format(birthdt,'%r') from peoplee;

####DATE MATH

-- counts no of dates
SELECT birthdate,datediff(curdate(),birthdate) 
FROM peoplee	

-- dateadd and datesub
select date_add(curdate(),interval 1 year)
select date_add(curdate(),interval 1 month)
select date_add(curdate(),interval 1 day)

select date_sub(curdate(),interval 1 year)

-- to check when a person turns 18
select birthdate,date_add(birthdate,interval 18 year) from peoplee;

select timediff(curtime(), '07:00:00');

select now() - interval 18 year;

select name,birthdate,year(birthdate+ interval 21 year)
 from peoplee;
 
 ##timestamps
 select now();
 
 select timestamp('2024-10-12 14:02:37')
 
create table captions(
text varchar(150),
created_at TIMESTAMP default CURRENT_TIMESTAMP
);

insert into captions(text) values('hola')
insert into captions(text) values('me and sunset')

select * from captions;

create table captions2(
text varchar(150),
created_at TIMESTAMP default CURRENT_TIMESTAMP,
updated_at TIMESTAMP on UPDATE CURRENT_TIMESTAMP
);

insert into captions2(text) values('hola')
insert into captions(text) values('me and sunset')

select * from captions2;

SET SQL_SAFE_UPDATES = 0;

UPDATE captions2 
SET text = 'i love live!!!!!!!!' 
WHERE text = 'hola';



##exercise

select curtime();

select dayofweek(curdate());

select dayname(curdate());

select current_timestamp();
SELECT date_FORMAT (now(), '%w/%d/%Y') as date

SELECT date_FORMAT (now(), '%w/%d/%Y') as date

select date_format(now(),'%M %D at %k:%i')

create table tweets(
content varchar(100),
username varchar(20),
created timestamp default current_timestamp()
);
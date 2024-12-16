CREATE DATABASE shirt_db;
use shirt_db;

CREATE TABLE shirts (
    shirt_id INT AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(50),
    color VARCHAR(50),
    shirt_size VARCHAR(5),
    last_worn INT
);

INSERT INTO shirts (article, color, shirt_size, last_worn)  
VALUES 
	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);
   
select * from shirts;   
    
#q1

insert into shirts (article,color,shirt_size,last_worn)   
VALUES ('polo shirt','purple','M',50);    
    
#Q2
select article,color 
from shirts;  

#Q3
select article, color, shirt_size, last_worn 
from shirts 
where shirt_size='M';
    
 #Q4
 update shirts
 set shirt_size='L'
 where article='polo shirt';
 
 #Q5
    
select * from shirts; 
    
update shirts
 set last_worn=0
 where last_worn=15;
    
#Q6

update shirts
set shirt_size='xs',color='off white' 
where color='white';    
    
    #Q7
delete from shirts
where last_worn=200;    
    
       #Q8
delete from shirts
where article='tank top';   
    
    
delete from shirts

DROP TABLE shirts;
 
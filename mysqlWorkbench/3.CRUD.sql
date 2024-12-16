use new;

-- 1.CREATE
CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);


-- 2.READ
select * from cats;
SELECT name FROM cats;
SELECT name,age FROM cats;

SELECT name,breed FROM cats;


                   #WHERE clause
SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE name ='Egg';

                      # ALIAS

select cat_id AS id,name from cats;
select cat_id AS id,name AS kitty_name from cats;


-- 3.UPDATE
SELECT * FROM cats
set SQL_SAFE_UPDATES=0

UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

UPDATE cats SET age=14 WHERE name='Misty';
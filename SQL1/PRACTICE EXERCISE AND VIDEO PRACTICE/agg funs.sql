select * from customer;

'''1.IN cmd'''
select * from customer
	where city IN('Philadelphia','Seattle');

'''in is like OR logical stmt bt in is preffered'''
select * from customer
	where city='Philadelphia' OR city='Seattle';

select * from customer
	where age IN(34,35);

'''2.between'''
select * from customer
	where age between 20 and 30;
'''it is same as'''
select * from customer
	where age>=20 and age<=30; 

select * from customer
	where age NOT BETWEEN 20 and 30; 

select * from sales
	where ship_date Between '2015-4-1' and '2016-4-1';



'''
	3.like:used for pattern matching in strings using wild cards
	%=allows u to match char of any str length
	_=allows u to match a single character
	'''

select * from customer
	where customer_name LIKE 'J%';


select * from customer
	where customer_name LIKE '%Nelson%';


select * from customer
	where customer_name LIKE '____ %';


select distinct city,customer_name from customer
	where customer_name NOT like 'S%';

select * from customer
	where customer_name LIKE 'G\%';



--ordering

select * from customer
	where state='California' 
	order by customer_name ;

select * from customer
	where state='California' 
	order by customer_name ASC;


select * from customer 
order by 2 Desc;


select * from customer
	where age>25 
	order by age asc,customer_name DESC;

select * from customer 
order by age ;


--limit

select * from customer
	where age>=20
    order by age desc
limit 8;

select * from customer
	where age>=25
    order by age asc
limit 10;

select * from product

select * from sales
where discount > 0
Order by discount DESC;

select * from sales
where discount > 0
Order by discount DESC
	limit 10;



---alias:used to assign name to a column
select * from customer
select customer_id as serial_number,customer_name as name,age as customer_age from customer; 


---count
select * from sales;


select count(*)from sales;

select count(order_line) AS "number of product ordered",count (distinct order_id) AS "number of orders"
	from sales where customer_id='CG-12520';






---sum
select * from sales;

select sum(profit) AS "total profit"
from sales;

SELECT * FROM PRODUCT;

select sum(Quantity) AS "total profit"
from sales where product_id='FUR-TA-10000577';


--average function
select * from customer


select AVG(age) AS "average age" 
from customer;


--avg commission i am getting as 10%
SELECT AVG(sales*0.10) as "average comission value" from sales;




--min and max
select * from sales;

select min(sales) as "minimum_sales_amount" from sales
where order_date between '2015-06-01'and'2015-06-30'

select max(sales) as "minimum_sales_amount" from sales
where order_date between '2015-06-01'and'2015-06-30'




-exercise

select * from sales;

select SUM(sales) as "sum of all sales value" from sales;

select * from customer;

select count(customer_name) as "no of customers" from customer 
	where age between 20 and 30 
	;


select avg(age) as "avg age east" from customer
where region='East';

select min(age),max(age) from customer
where city='Philadelphia'




--GROUPBY
--suppose w wanna find out the number of peeps living in aparticualr satea or city u can grup them using this	

select * from customer;	
	
select region,Count(customer_id) AS "customer count"
	from customer 
	group by region;

--to find of the quantity of product sold from sales table

select product_id,Sum(Quantity) AS quantity_sold
	from sales 
	group by product_id
	Order by quantity_sold Desc;



--FIND THE TOP 5 CUSTOMERS WHO HAVE SPEND MOST OF THE TIME AT OUR STORE AND FIND OUT ABOUT THEN
	--HERE WE HAVE USED ALL OF OUR CLAUSES AND AGGREGATE FUNCTIONS
select customer_id,
MIN(sales) as min_sales,
Max(sales) as max_sales,
AVG(sales) as Average_sales,
Sum(sales) as total_sales
FROM sales
GROUP BY customer_id
order by total_sales DESC
LIMIT 5;

SELECT * FROM customer;

select region,state,avg(age),COUNT(customer_name) from customer GROUP BY region,state;
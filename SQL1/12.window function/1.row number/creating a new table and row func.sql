--suppose we have to create a lost of top 3 customers with maximum orders from each state?
/*

steps
1. combine customer and order table:so taht we get order detail of each customer
2. add row numbers within state
3. filter row_number less than equal to 3

*/

--select top 10 rows of our table
select * from customer limit 10;
select * from sales limit 10;

--combo both tables

select a.*,b.order_num,b.sales_tot,b.quantity_tot,b.profit_tot
from customer as a
left join (select customer_id,
	              count(distinct order_id) AS order_num,
	              SUM(sales) as sales_tot,
	              sum(quantity) as quantity_tot,
	              sum(profit) as profit_tot
	from sales group by customer_id) as b
on a.customer_id=b.customer_id

select * from sales where customer_id ='AA-10315' order by order_id

create table customer_order as (select a.*,b.order_num,b.sales_tot,b.quantity_tot,b.profit_tot
from customer as a
left join (select customer_id,
	              count(distinct order_id) AS order_num,
	              SUM(sales) as sales_tot,
	              sum(quantity) as quantity_tot,
	              sum(profit) as profit_tot
	from sales group by customer_id) as b
on a.customer_id=b.customer_id)


select * from customer_order


--now after a new table 


select customer_id,customer_name,state,order_num,
	row_number() over
(partition by state order by order_num desc) as row_num
from customer_order



select * from(select customer_id,customer_name,state,order_num,
	row_number() over
(partition by state order by order_num desc) as row_num
from customer_order) as a where a.row_num<=3;
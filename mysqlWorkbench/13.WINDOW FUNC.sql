CREATE DATABASE EMP;
USE EMP;
show tables;


CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);
 
 SELECT department,AVG(salary) from employees
 group by department;
 
 -- 1.over()
 SELECT department,AVG(salary) over() from employees;
 
select emp_no,
department,
salary,
avg(salary) over() 
from employees;

select emp_no,
department,
salary,
MIN(salary) over(),
MAX(salary) over()
from employees;

##2.partition by

select emp_no,
department,
salary,
avg(salary) over(partition by department) as dept_avg,
avg(salary) over() AS company_avg
from employees;

select emp_no,
department,
salary,
count(*) over(partition by department) as dept_count
from employees;

select emp_no,
department,
salary,
sum(salary) over(partition by department) as dept_salary_payroll,
sum(salary) over() as total_payroll
from employees;

##3.order by with windows func
show tables;
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;


SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;


##4.rank()

-- to get the rank of the perple with highest salary
SELECT 
    emp_no, 
    department, 
    salary, 
    RANK() OVER(order by salary DESC) as 'overall salary rank',
    rank() OVER(PARTITION BY department ORDER BY salary) as 'rank by dept'
FROM employees order by department;

##5.row_number() and dense_rank()

SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

#6.ntile

SELECT 
    emp_no, 
    department, 
    salary,
	NTILE(4) over(partition by department ORDER BY salary desc) as salary_quartile,
	NTILE(4) over(ORDER BY salary desc) as salary_quartile
FROM employees ;

#7.first_value
SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;

#lead and lag
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;
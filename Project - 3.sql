create table books
(id int not null primary key,
title varchar (20) not null,
author varchar(20) not null,
year varchar(5) not null);

insert into books
values
(1, 'Harry Potter', 'Rowling', '1997'),
(2, 'Lord of Rings', 'Tolkien', '1954'), 
(3, 'To kill a Mokingbird', 'Lee', '1960');

select * from books;

create table products
(id int not null primary key,
product_name varchar(10) not null,
price int not null);

insert into products
values
(1, 'Apple', 2),
(2, 'Banana', 1),
(3, 'Orange', 3);

select * from products;

create table employees
(id int not null primary key,
first_name varchar(10) not null,
Manager int not null);

alter table employees modify Manager varchar(10);

insert into employees
values
(1, 'Jhon', NULL),
(2, 'David', 1),
(3, 'Marry', 1);

update employees
set Manager = NULL
where id = 1;

select * from employees;

create table orders
(id int not null primary key,
order_date date not null,
amount int not null);

insert into orders
values
(1, '2023-05-01', 300),
(2, '2023-03-10', 400),
(3, '2023-07-20', 100);

select * from orders;


create table customers
(id int not null primary key,
customer_name varchar(10) not null,
city varchar(10) not null);

insert into customers
values
(1, 'Jhon', NULL),
(2, 'smith', 'Boston'),
(3, 'Jhonson', NULL);


-- to update any column first we have to alter and then update.

alter table customers modify city varchar(10) NULL;

update customers
set city = NULL
where id = 3;

select * from customers;


-- Q1. Retrieve the title and author of books published after 1960.

select title, author, year from books
where year>1960;


-- Q2. Retrieve the books sorted by their publication year
        in ascending order.
        
        select title, year from books
        order by year;
        
-- Q3. Retrieve the names of products in uppercase.
      
      select upper(product_name) from products;
      
      
-- Q4. Retrieve the names of products with the first letter capitalized.

  select concat(upper(substring(product_name,1,1)), lower(substring(product_name,2))) as updated from products;
  
  -- Q5. Retrieve the first names of employees along with their manager's first name.
  
  SELECT e1.first_name AS employee_first_name, e2.first_name AS manager_first_name
FROM employees e1
LEFT JOIN employees e2 ON e1.id = e2.id;

  
-- Q6. Retrieve the names of employees who do not have a manager.

select first_name from employees
where Manager is NULL;

-- Q4. Retrieve the month with the highest total order amount.

select month(order_date) as Highest_month, sum(amount) as Total_amount from orders
group by Highest_month
order by Total_amount desc
limit 1;

 -- Q8. Retrieve the average order amount for each month.


select month(order_date) as Month_wise, avg(amount) as avg_amount
from orders
group by Month_wise
order by Month_wise;

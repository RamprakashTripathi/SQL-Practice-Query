create table employees
(id int not null primary key,
 first_name varchar(10),
 last_name varchar(10) not null,
 salary int not null);

insert into employees
values
(1, 'sumit', 'pandey', 12000),
(2, 'Rahul', 'pandit', 15000),
(3, 'john', 'clark', 10000),
(4, 'Mary', 'david', 20000),
(5, 'smith', 'oden', 50000);

select *from employees;

create table orders
(id int not null primary key,
order_date date not null,
amount int not null);

insert into orders
values
(1, '2023-05-01', 200),
(2, '2023-04-20', 500),
(3, '2023-07-05', 100),
(4, '2023-01-25', 800),
(5, '2023-10-10', 300);

select *from orders;

create table customer
(id int not null primary key,
customer_name varchar(20) not null);

insert into customer
values
(101, 'Mayank'),
(102, 'Rajat'),
(103, 'Roland'),
(104, 'Lokesh'),
(105, 'Paul');

select *from customer;

create table product
(id int not null primary key,
Item_name varchar(20) not null,
price int not null);

insert into product
values
(1, 'Item A', 25),
(2, 'Item B', 10),
(3, 'Item C', 20),
(4, 'Item D', 50),
(5, 'Item E', 35);

select *from product;

create table orders_product
(order_id int not null,
product_id int not null); 

insert into orders_product
values
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2);



-- Run all query at once
select *from customer;
select * from employees;
select * from orders;
select * from orders_product
select * from product


-- Easy :
-- Q1. Retrieve all columns for all employees..

select * from employees;

-- Q2 Retrieve first and last names of employees.

select first_name, last_name from employees;

-- Q3. Retrieve employees with a salary greater than 15000.

select first_name, last_name from employees
where salary > 15000;

-- Moderate : 

-- Q4. Retrieve a list of orders with customer names.

select o.order_date, c.customer_name
from orders o
join customer c on c.id = o.id;

-- Q5. Retrieve the total amount spent by each customer.

select c.customer_name, o.amount from customer c
join orders o on c.id = o.id; 

-- Q6. Using the orders table.Retrieve the total amount of all orders.
    
    select sum(orders.amount) as total_amount
    from orders;
    
    -- Q7. Retrieve the average amount of orders.
    
    select avg(amount) as orders_avg
    from orders;
    
    -- Q8. Retrieve the maximum amount from orders.
    
        select max(amount) as orders_avg
    from orders;
    
    -- Q9. Retrieve the number of orders placed in each month.
    
    select count(order_date) as NO_of_orders, order_date
    from orders
    GROUP BY order_date;
    
    -- Advance :

    -- Q10. Retrieve the total amount spent on each order.
    
    select op.order_id,
    (select sum(price) from product
    where id in (select product_id from orders_product
    where op.order_id = order_id)) as total_ampunt_spent
    from orders_product op
    group by op.order_id;
    
    -- Q11. Retrieve the names of products that have been ordered:
    
    select distinct p.id, p.Item_name from product p
    where p.id in (select product_id from orders_product);
    
    
    
    
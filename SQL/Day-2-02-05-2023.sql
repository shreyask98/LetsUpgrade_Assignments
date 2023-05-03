
# Shreyas Kumbhar 02-05-2023
#  SQL Essentials Bootcamp

CREATE DATABASE sales;

USE sales;

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_total DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, order_total) 
VALUES (1, 101, '2022-04-15', 120.50);

INSERT INTO orders (order_id, customer_id, order_date, order_total) 
VALUES (2, 102, '2022-05-03', 350.00);

INSERT INTO orders (order_id, customer_id, order_date, order_total) 
VALUES (3, 103, '2022-05-10', 45.75);

INSERT INTO orders (order_id, customer_id, order_date, order_total) 
VALUES (4, 104, '2022-05-18', 205.80);

select * from orders;
# ------------------------------------------------------------------------------------------ #
# GROUP BY - to group rows based on one or more columns

SELECT customer_id, SUM(order_total) as total_spent
FROM orders
GROUP BY customer_id;

# This will retrieve the total amount each customer has spent on orders by grouping rows by customer_id.


# ------------------------------------------------------------------------------------------ #
# HAVING - to filter the results of a GROUP BY clause

SELECT customer_id, SUM(order_total) as total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(order_total) > 200;

# This will retrieve only the customers who have spent more than $200 in total by using the HAVING clause to filter the results of the GROUP BY clause.

# ------------------------------------------------------------------------------------------ #
# JOIN - to combine data from multiple tables based on a common column


CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  customer_email VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, customer_email)
VALUES (101, 'John Doe', 'john@example.com'),
       (102, 'Jane Smith', 'jane@example.com'),
       (103, 'Bob Johnson', 'bob@example.com'),
       (104, 'Alice Williams', 'alice@example.com');
       
SELECT orders.order_id, customers.customer_name, orders.order_date, orders.order_total
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id;
# This will retrieve data from both the "orders" and "customers" tables by joining them on the customer_id column.

# ------------------------------------------------------------------------------------------ #
# ORDER BY - to sort the results of a query based on one or more columns


SELECT * FROM orders
ORDER BY order_date DESC;

# This will retrieve all orders and sort them in descending order based on the order_date column.

# ------------------------------------------------------------------------------------------ #
# Subquery: Get the customer names and email addresses of customers who have placed an order with a total amount greater than $100:

SELECT customer_name, customer_email
FROM customers
WHERE customer_id IN (
  SELECT customer_id
  FROM orders
  WHERE order_total > 100
);

# ------------------------------------------------------------------------------------------ #

# UNION: Get the orders placed by customer 101 or customer 102:

SELECT customer_id, order_date, order_total
FROM orders
WHERE customer_id = 101
UNION
SELECT customer_id, order_date, order_total
FROM orders
WHERE customer_id = 102;
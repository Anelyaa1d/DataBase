CREATE DATABASE myLAB4;--1

CREATE TABLE customers(--2
  customer_id SERIAL PRIMARY KEY,
  cust_name VARCHAR(50),
  city VARCHAR(50),
  grade INT,
  salesman_id INT
);
SELECT * FROM customers;

INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3002,'Nick Rimando','New York', 100, 5001);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3005,'Graham Zusi','California', 200, 5002);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3001,'Brad Guzan','London', NULL, 5005);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3004,'Fabian Johns','Paris', 300, 5006);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3007,'Brad Davis','New York', 200, 5001);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3009,'Geoff Camero','Berlin', 100, 5003);
INSERT INTO customers(customer_id,cust_name,city,grade,salesman_id) VALUES(3008,'Julian Green','London', 300, 5002);

SELECT * FROM customers WHERE grade > 100;--3

SELECT * FROM customers WHERE city = 'New York' AND grade > 100;--4

SELECT * FROM customers WHERE city = 'New York' OR  grade > 100;--5

SELECT * FROM customers WHERE city = 'Paris' OR city = 'Rome';--6

SELECT * FROM customers WHERE cust_name LIKE 'B%';--7

CREATE TABLE orders(--8
  order_id SERIAL PRIMARY KEY,
  customer_id INT,
  description VARCHAR(255),
  purch_amt INT
);

SELECT * FROM orders;

INSERT INTO orders(order_id, customer_id, description, purch_amt) VALUES(132, 3002, NULL, 17);
INSERT INTO orders(order_id, customer_id, description, purch_amt) VALUES(453, 3004, NULL, 20);
INSERT INTO orders(order_id, customer_id, description, purch_amt) VALUES(245, 3009, NULL, 10);
INSERT INTO orders(order_id, customer_id, description, purch_amt) VALUES(102, 3007, NULL, 9);
INSERT INTO orders(order_id, customer_id, description, purch_amt) VALUES(321, 3002, NULL, 15);
INSERT INTO orders(order_id, customer_id, description, purch_amt) VALUES(098, 3001, NULL, 23);
INSERT INTO orders(order_id, customer_id, description, purch_amt) VALUES(222, 3008, NULL, 5);
INSERT INTO orders(order_id, customer_id, description, purch_amt) VALUES(075, 3009, NULL, 3);

SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');--9

SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE purch_amt > 10);--10

SELECT SUM(purch_amt) FROM orders ;--11

SELECT avg(purch_amt) FROM orders;--12

SELECT * FROM customers WHERE cust_name NOTNULL;--13

SELECT purch_amt FROM orders ORDER BY purch_amt DESC LIMIT 1;--14




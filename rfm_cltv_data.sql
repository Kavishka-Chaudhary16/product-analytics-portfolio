---Schema Query

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  signup_date DATE
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name, signup_date) VALUES
(1, 'Kavishka',     '2024-01-01'),
(2, 'Rahul',        '2024-01-05'),
(3, 'Aisha',        '2024-02-01'),
(4, 'Neeraj',       '2024-02-10'),
(5, 'Divya',        '2024-03-01'),
(6, 'Ishaan',       '2024-03-15'),
(7, 'Sanya',        '2024-04-01'),
(8, 'Varun',        '2024-04-15'),
(9, 'Ritika',       '2024-05-01'),
(10, 'Aditya',      '2024-06-01');

INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(101, 1, '2024-01-10', 1500.00),
(102, 1, '2024-02-10', 2000.00),
(103, 1, '2024-03-10', 1800.00),
(104, 2, '2024-01-15', 1200.00),
(105, 2, '2024-03-01', 1000.00),
(106, 3, '2024-02-15', 700.00),
(107, 3, '2024-04-10', 800.00),
(108, 4, '2024-02-20', 400.00),
(109, 5, '2024-03-10', 1500.00),
(110, 5, '2024-03-15', 1300.00),
(111, 5, '2024-04-10', 1000.00),
(112, 6, '2024-03-20', 2500.00),
(113, 7, '2024-04-05', 500.00),
(114, 7, '2024-04-15', 700.00),
(115, 8, '2024-04-20', 900.00),
(116, 9, '2024-05-05', 300.00),
(117, 9, '2024-06-01', 600.00),
(118, 10, '2024-06-10', 2000.00),
(119, 10, '2024-06-15', 1800.00),
(120, 10, '2024-06-20', 2200.00);


---SQL QUERY

SELECT * FROM customers;

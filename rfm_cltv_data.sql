-- STEP 1: Create tables

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

-- STEP 2: Insert data

INSERT INTO customers (customer_id, name, signup_date) VALUES
(1, 'Kavishka', '2024-01-01'),
(2, 'Rahul', '2024-01-05'),
(3, 'Aisha', '2024-02-01'),
(4, 'Neeraj', '2024-02-10'),
(5, 'Divya', '2024-03-01'),
(6, 'Ishaan', '2024-03-15'),
(7, 'Sanya', '2024-04-01'),
(8, 'Varun', '2024-04-15'),
(9, 'Ritika', '2024-05-01'),
(10, 'Aditya', '2024-06-01');

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

-- STEP 3: RFM + CLTV Dashboard Query

SELECT
  c.customer_id,
  c.name,
  DATEDIFF('2024-07-01', MAX(o.order_date)) AS recency_days,
  COUNT(o.order_id) AS frequency,
  SUM(o.order_amount) AS monetary_value,

  CASE 
    WHEN DATEDIFF('2024-07-01', MAX(o.order_date)) <= 15 THEN 5
    WHEN DATEDIFF('2024-07-01', MAX(o.order_date)) <= 30 THEN 4
    WHEN DATEDIFF('2024-07-01', MAX(o.order_date)) <= 45 THEN 3
    WHEN DATEDIFF('2024-07-01', MAX(o.order_date)) <= 60 THEN 2
    ELSE 1
  END AS r_score,

  CASE 
    WHEN COUNT(o.order_id) >= 5 THEN 5
    WHEN COUNT(o.order_id) >= 3 THEN 4
    WHEN COUNT(o.order_id) = 2 THEN 3
    WHEN COUNT(o.order_id) = 1 THEN 2
    ELSE 1
  END AS f_score,

  CASE 
    WHEN SUM(o.order_amount) >= 6000 THEN 5
    WHEN SUM(o.order_amount) >= 4000 THEN 4
    WHEN SUM(o.order_amount) >= 2000 THEN 3
    WHEN SUM(o.order_amount) >= 1000 THEN 2
    ELSE 1
  END AS m_score,

  CONCAT(
    CASE 
      WHEN DATEDIFF('2024-07-01', MAX(o.order_date)) <= 15 THEN '5'
      WHEN DATEDIFF('2024-07-01', MAX(o.order_date)) <= 30 THEN '4'
      WHEN DATEDIFF('2024-07-01', MAX(o.order_date)) <= 45 THEN '3'
      WHEN DATEDIFF('2024-07-01', MAX(o.order_date)) <= 60 THEN '2'
      ELSE '1'
    END,
    CASE 
      WHEN COUNT(o.order_id) >= 5 THEN '5'
      WHEN COUNT(o.order_id) >= 3 THEN '4'
      WHEN COUNT(o.order_id) = 2 THEN '3'
      WHEN COUNT(o.order_id) = 1 THEN '2'
      ELSE '1'
    END,
    CASE 
      WHEN SUM(o.order_amount) >= 6000 THEN '5'
      WHEN SUM(o.order_amount) >= 4000 THEN '4'
      WHEN SUM(o.order_amount) >= 2000 THEN '3'
      WHEN SUM(o.order_amount) >= 1000 THEN '2'
      ELSE '1'
    END
  ) AS rfm_score,

  CASE 
    WHEN 
      DATEDIFF('2024-07-01', MAX(o.order_date)) <= 15 AND
      COUNT(o.order_id) >= 3 AND
      SUM(o.order_amount) >= 5000 THEN 'Champion'
    WHEN 
      DATEDIFF('2024-07-01', MAX(o.order_date)) <= 30 AND
      COUNT(o.order_id) >= 2 THEN 'Loyal Customer'
    WHEN 
      DATEDIFF('2024-07-01', MAX(o.order_date)) > 60 AND
      COUNT(o.order_id) = 1 THEN 'At-Risk'
    ELSE 'Others'
  END AS customer_segment,

  ROUND(AVG(o.order_amount), 2) AS avg_order_value,
  ROUND(DATEDIFF(MAX(o.order_date), MIN(o.order_date)) / 30, 1) AS lifespan_months,
  ROUND(AVG(o.order_amount) * COUNT(o.order_id) * (DATEDIFF(MAX(o.order_date), MIN(o.order_date)) / 30), 2) AS cltv

FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY cltv DESC;

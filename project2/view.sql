-------- VIEW.SQL ----
CREATE VIEW product_sales AS
SELECT o.order_no, co.SKU, co.qty, (co.qty * pr.price) AS total_price,
       EXTRACT(YEAR FROM o.date) AS year,
       EXTRACT(MONTH FROM o.date) AS month,
       EXTRACT(DAY FROM o.date) AS day_of_month,
       TO_CHAR(o.date, 'Day') AS day_of_week,
       SUBSTRING(c.address FROM POSITION(' ' IN c.address) + 1) AS city
FROM customer c
JOIN orders o ON c.cust_no = o.cust_no
JOIN contains co ON o.order_no = co.order_no
JOIN pay p ON o.order_no = p.order_no
JOIN product pr ON co.SKU = pr.SKU;

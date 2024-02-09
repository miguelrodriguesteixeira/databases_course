-- Query 1 --
-- Liste o nome de todos os clientes que fizeram encomendas contendo
-- produtos de preço superior a €50 no ano de 2023; --

SELECT c.name
FROM client c
JOIN order_ e ON c.cust_no = e.cust_no
JOIN contains_ o ON e.order_no = o.order_no
JOIN product p ON p.sku = o.sku
WHERE p.price > 50 AND e.date > '2022-12-31' AND e.date < '2024-01-01';

-- Query 2 --
-- Liste o nome de todos os empregados que trabalham em armazéns e
-- não em escritórios e processaram encomendas em Janeiro de 2023; --

SELECT e.name
FROM employee e
JOIN works w ON e.ssn = w.ssn
JOIN warehouse wh ON w.address = wh.address
JOIN process p ON e.ssn = p.ssn
JOIN order_ o ON p.order_no = o.order_no
WHERE wh.address NOT IN (
    SELECT address FROM office
)
AND o.date >= '2023-01-01' AND o.date <= '2023-01-31';


-- Query 3
-- Indique o nome do produto mais vendido; --

SELECT p.name
FROM product p
JOIN contains_ ct ON p.sku = ct.sku
GROUP BY p.name
ORDER BY SUM(ct.qty) DESC
LIMIT 1;

-- Query 4
-- Indique o valor total de cada venda realizada --

SELECT s.order_no, SUM(p.price * ct.qty) AS total_value
FROM sale s
JOIN order_ o ON s.order_no = o.order_no
JOIN contains_ ct ON o.order_no = ct.order_no
JOIN product p ON ct.sku = p.sku
GROUP BY s.order_no;

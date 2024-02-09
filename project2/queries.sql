---- QUERIES.SQL -------
-- Qual o número e nome do(s) cliente(s) com maior valor
-- total de encomendas pagas?--
SELECT c.cust_no, c.name
FROM customer c
JOIN pay p ON c.cust_no = p.cust_no
GROUP BY c.cust_no, c.name
ORDER BY SUM(p.order_no) DESC
FETCH FIRST ROW ONLY;


-- Qual o nome dos empregados que processaram encomendas em
-- todos os dias de 2022 em que houve encomendas?
SELECT e.name
FROM employee e
JOIN process pr ON e.ssn = pr.ssn
JOIN orders o ON pr.order_no = o.order_no
WHERE EXTRACT(YEAR FROM o.date) = 2022
GROUP BY e.name
HAVING COUNT(DISTINCT o.date) = (SELECT COUNT(DISTINCT o2.date)
                                 FROM orders o2
                                 WHERE EXTRACT(YEAR FROM o2.date) = 2022);


-- Quantas encomendas foram realizadas mas não pagas em cada mês de 2022? --
SELECT EXTRACT(MONTH FROM o.date) AS month, COUNT(*) AS num_orders
FROM orders o
LEFT JOIN pay p ON o.order_no = p.order_no
WHERE EXTRACT(YEAR FROM o.date) = 2022 AND p.order_no IS NULL
GROUP BY EXTRACT(MONTH FROM o.date);



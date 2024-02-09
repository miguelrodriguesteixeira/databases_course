---------------OLAP 1-------------------
SELECT
    pr.product_name,
    SUM(ps.qty) AS total_quantity,
    SUM(ps.total_price) AS total_sales,
    ps.city,
    ps.month,
    ps.day_of_month,
    ps.day_of_week
FROM
    product_sales ps
JOIN
    product pr ON ps.SKU = pr.SKU
WHERE
    ps.year = 2022
GROUP BY
    CUBE (pr.product_name, ps.city, ps.month, ps.day_of_month, ps.day_of_week)
ORDER BY
    pr.product_name, ps.city, ps.month, ps.day_of_month, ps.day_of_week;


---------------OLAP 2-------------------------
SELECT
    ps.month,
    ps.day_of_week,
    AVG(ps.total_price) AS average_daily_sales
FROM
    product_sales ps
WHERE
    ps.year = 2022
GROUP BY
    ROLLUP (ps.month, ps.day_of_week)
ORDER BY
    ps.month, ps.day_of_week;
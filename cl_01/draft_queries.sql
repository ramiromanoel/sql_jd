--
select * from orders;


--
SELECT 
	company_name,
	COUNT(order_id) qtd_ordens
FROM customers cs
INNER JOIN orders os ON cs.customer_id = os.customer_id
GROUP BY company_name;


--
SELECT * 
FROM products
WHERE unit_price BETWEEN 10 AND 50 AND category_id NOT IN (1,2,3);

--
SELECT 
    TO_CHAR(o.order_date, 'MM-YYYY') AS mes_ano,
    ROUND(SUM((od.unit_price * od.quantity * (1 - od.discount))::numeric), 2) AS total_faturamento
FROM orders o
JOIN order_details od 
    ON o.order_id = od.order_id
GROUP BY TO_CHAR(o.order_date, 'MM-YYYY')
ORDER BY MIN(o.order_date);


--
SELECT 
    p.product_name,
    ROUND(SUM((od.unit_price * od.quantity * (1 - od.discount))::numeric), 2) AS total_faturamento
FROM order_details od
JOIN products p 
    ON od.product_id = p.product_id
JOIN orders o 
    ON o.order_id = od.order_id
GROUP BY p.product_name
HAVING SUM((od.unit_price * od.quantity * (1 - od.discount))::numeric) > 10000
ORDER BY total_faturamento DESC;


--


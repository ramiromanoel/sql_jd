select * from orders;

SELECT 
	company_name,
	COUNT(order_id) qtd_ordens
FROM customers cs
INNER JOIN orders os ON cs.customer_id = os.customer_id
GROUP BY company_name;
-- verificando intregidade
EXPLAI
SELECT *
FROM orders o
INNER JOIN customers c ON c.customer_id = o.customer_id
WHERE EXTRACT(YEAR FROM o.order_date) = 1996;
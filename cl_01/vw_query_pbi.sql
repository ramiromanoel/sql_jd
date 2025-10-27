CREATE OR REPLACE VIEW vw_faturamento_mensal AS
SELECT
    f.mes_ano,
    f.total_faturamento,
    f.total_pedidos,
    f.total_itens,
    ROUND(f.total_faturamento / NULLIF(f.total_pedidos, 0), 2) AS ticket_medio
FROM (
    SELECT 
        TO_CHAR(o.order_date, 'YYYY-MM') AS mes_ano,
        SUM((od.unit_price * od.quantity * (1 - od.discount))::numeric) AS total_faturamento,
        COUNT(DISTINCT o.order_id) AS total_pedidos,
        SUM(od.quantity) AS total_itens
    FROM orders o
    JOIN order_details od 
        ON o.order_id = od.order_id
    WHERE o.order_date IS NOT NULL
    GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
) AS f
ORDER BY f.mes_ano;

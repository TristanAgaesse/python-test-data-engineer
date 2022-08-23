SELECT 
    client_id,
    sum(CASE p.product_type WHEN 'MEUBLE' THEN t.prod_price * t.prod_qty ELSE 0 END) as ventes_meubles,
    sum(CASE p.product_type WHEN 'DECO' THEN t.prod_price * t.prod_qty ELSE 0 END) as ventes_deco
FROM TRANSACTION t
INNER JOIN PRODUCT_NOMENCLATURE p on t.prod_id = p.product_id
WHERE year(date_parse(date, 'dd/mm/yyyy')) = 2019
GROUP BY client_id
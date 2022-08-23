SELECT 
    date, 
    sum(prod_price * prod_qty) as ventes
FROM TRANSACTION 
WHERE year(date_parse(date, 'dd/mm/yyyy')) = 2019
GROUP BY date 
ORDER BY date_parse(date, 'dd/mm/yyyy')
SELECT
    d.atccode,
    d.drug,
    p.id,
    p.date,
    p.title,
    p.journal
FROM {{ref('rsv__drugs')}} d
LEFT OUTER JOIN {{ref('cmp__pubmed_all')}} p on upper(p.title) like '%' || d.drug || '%'
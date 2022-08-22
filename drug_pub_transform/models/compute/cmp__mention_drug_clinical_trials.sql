SELECT
    d.atccode,
    d.drug,
    p.id,
    p.date,
    p.scientific_title as title,
    p.journal
FROM {{ref('rsv__drugs')}} d
LEFT OUTER JOIN {{ref('rsv__clinical_trials')}} p on upper(p.scientific_title ) like '%' || d.drug || '%'
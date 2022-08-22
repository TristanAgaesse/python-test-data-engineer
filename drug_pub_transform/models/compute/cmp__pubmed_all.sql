SELECT id, title, date, journal
FROM {{ ref('rsv__pubmed') }}

UNION ALL

SELECT id, title, date, journal
FROM {{ ref('rsv__pubmed_json') }}
SELECT
    atccode,
    drug,
    date,
    journal
FROM {{ref('cmp__mention_drug_pubmed')}}

UNION ALL

SELECT
    atccode,
    drug,
    date,
    journal
FROM {{ref('cmp__mention_drug_clinical_trials')}}
SELECT
    d.atccode,
    d.drug,
    p.date,
    p.journal
FROM {{ref('cmp__mention_drug_pubmed')}}

UNION ALL

SELECT
    d.atccode,
    d.drug,
    p.date,
    p.journal
FROM {{ref('cmp__mention_drug_clinical_trials')}}
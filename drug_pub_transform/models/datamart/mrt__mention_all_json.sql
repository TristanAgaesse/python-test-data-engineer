WITH journal_mention AS (

    SELECT
        atccode,
        drug,
        date,
        journal

    FROM {{ ref('cmp__mention_drug_journal') }}

),

pubmed_mention AS (

    SELECT
        atccode,
        drug,
        date,
        id,
        title

    FROM {{ ref('cmp__mention_drug_pubmed') }}

),

trial_mention AS (

    SELECT
        atccode,
        drug,
        date,
        id,
        title

    FROM {{ ref('cmp__mention_drug_clinical_trials') }}

),
all_data AS (
    SELECT '{"type":"journal"}' || to_jsonb(t) 
    FROM (SELECT * FROM journal_mention) t
    
    UNION ALL

    SELECT '{"type":"pubmed"}' || to_jsonb(t)
    FROM (SELECT * FROM pubmed_mention) t

    UNION ALL

    SELECT '{"type":"clinical_trial"}' || to_jsonb(t)
    FROM (SELECT * FROM trial_mention) t
)
select *
from all_data a


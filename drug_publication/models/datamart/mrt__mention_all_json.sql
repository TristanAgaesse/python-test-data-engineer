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

    SELECT jsonb_build_object(
		'journal', j,
        'pubmed', p,
        'clinical_trial', c
	)
	 
    FROM (SELECT json_agg(to_jsonb(jm)) as mentions from journal_mention jm) j,
	(SELECT json_agg(to_jsonb(pm)) as mentions from pubmed_mention pm)  p,
	(SELECT json_agg(to_jsonb(tm)) as mentions from trial_mention tm)  c

)
select *
from all_data a


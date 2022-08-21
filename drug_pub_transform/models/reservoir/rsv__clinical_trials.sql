select *
from {{ ref('seed', 'clinical_trials') }}
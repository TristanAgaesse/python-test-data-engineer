select *
from {{ source(generate_schema_name('seed'), 'clinical_trials') }}
where id is not null and journal is not null
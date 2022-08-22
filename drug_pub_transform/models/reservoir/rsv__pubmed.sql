select *
from {{ source(generate_schema_name('seed'), 'pubmed') }}
where id is not null
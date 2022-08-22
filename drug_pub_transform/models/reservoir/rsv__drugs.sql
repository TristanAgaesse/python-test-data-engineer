select *
from {{ source(generate_schema_name('seed'), 'drugs') }}
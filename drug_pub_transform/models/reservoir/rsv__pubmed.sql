select 
    id::varchar, 
    title, 
    date, 
    journal

from {{ source(generate_schema_name('seed'), 'pubmed') }}
where id is not null
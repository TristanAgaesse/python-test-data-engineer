WITH json_data as (

    SELECT *
    FROM {{ source('dev_seed.pubmed_json') }}
)

select *
from json_to_recordset(json_data)
as x("id" varchar, "title" varchar, "date" varchar, "journal" varchar)
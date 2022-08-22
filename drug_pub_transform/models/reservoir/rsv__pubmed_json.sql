SELECT 
    id::varchar, 
    title, 
    date, 
    journal

FROM  {{ source(generate_schema_name('seed'),'pubmed_json') }} p
    CROSS JOIN LATERAL  
    json_to_recordset(p.doc) as x("id" varchar, "title" varchar, "date" varchar, "journal" varchar)

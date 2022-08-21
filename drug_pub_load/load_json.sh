JSON_FILE=$1
TARGET_TABLE=$2

PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p 5432 -U $DB_USER -c "CREATE SCHEMA IF NOT EXISTS SEED;"
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p 5432 -U $DB_USER -c "drop table if exists ${TARGET_TABLE};"
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p 5432 -U $DB_USER -c "create unlogged table ${TARGET_TABLE} (doc json);"

# remove new lines
tr --delete '\n' < ${JSON_FILE} > ${JSON_FILE}_temp.json

PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p 5432 -U $DB_USER -c "\copy ${TARGET_TABLE} FROM ${JSON_FILE}_temp.json;"

rm -rf ${JSON_FILE}_temp.json
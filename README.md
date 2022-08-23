# python-test-data-engineer

This is a technical demonstration of a data pipeline using DBT and Postgres.

## How to use

### Install

Pre-requisite:
- install docker
- store the environment configuration in a .env file similar to .env.example 

### RUN

```bash
make up
make run
```

### Generate documentation

```bash
make docs
```

## Architecture of the solution

### Code organisation

Folders:
- data contains the input files.
- output contains the output files.
- drug_publication contains the dbt transformations.
- analysis contains an ad-hoc script to analyse the output file
- sql_test contains sql queries for a technical test

### Data loading

The data files are loaded in a database (PostgreSQL). 

Loading of csv files is done by dbt seeds.
Loading of json files is done using a custom bash script that uses the "copy" postgres command. 

### Data transformations 

Data is transformed in the database using SQL queries. 
DBT manages the SQL queries. 

Data transformations are done in several stages. Each stage has a diferent schema in the database:
1) seed: data just loaded, same structure as the inputs (sometime called staging)
2) reservoir: intermediate tables with data cleaned
3) compute: intermediate tables with aggregations
4) datamart: final tables, ready to use

### Data export

Data are exported from the database to files using SQL queries.

### Devops 

Postgres and dbt run in docker to ensure portability and ease of installation.

Environment variables (database credentials, hosts...) are set in a .env file. This file is not commited in git to keep credentials safe.

DBT can handle several environments (for instance dev, uat, prod), multiple developers (using different schema for each developer).

DBT can generate documentation automatically.

The git commit messages follow the semantic release naming convention, so that versions of the code can be automatically incremented. 



## Comments on scalability

This architecture is centered on SQL transformations in a data warehouse. This is similar to the so-called 'modern data stack'. 

The aim is to take advantage of the scalability of modern data warehouse/lakehouse such as Snowflake or Big Query.

The transform part of this architure is very scalable, even if there are thousands of files or tables of several terrabytes.

The load part in this code is suitable only for medium scale data. It could be improved to be more scalable using distributed code such as spark and cloud data storage.
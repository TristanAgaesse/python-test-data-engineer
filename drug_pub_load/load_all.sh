DATA_DIR=$PWD/data
SCRIPT_DIR=$PWD/drug_pub_load

$SCRIPT_DIR/load_json.sh $DATA_DIR/pubmed.json dev_seed pubmed_json

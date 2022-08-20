.phony: install

install:
	pip install virtualenv
	virtualenv dbt-env
	. dbt-env/bin/activate ; pip install -r requirements.txt

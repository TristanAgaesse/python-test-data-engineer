.phony: install, prerequisites

PROJECT=($PWD)

install: 
	pip install virtualenv
	virtualenv dbt-env
	. dbt-env/bin/activate ; pip install -r requirements.txt

prerequisites:
	curl https://pyenv.run | bash
	pyenv install pypy3.9-7.3.9
	pyenv global pypy3.9-7.3.9
	sudo apt-get install libpq-dev
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

## The Makefile includes instructions on environment setup and lint tests
setup:
	# Create python virtualenv & source it
	python3 -m venv capstone
	# source ~/.capstone/bin/activate

install:
	# This should be run from inside a virtualenv
	. capstone/bin/activate &&\
	pip install --upgrade pip &&\
	pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

validate-circleci:
	circleci config process .circleci/config.yml

run-circleci-local:
	circleci local execute

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint --ignore=DL3013 Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenvi
	. capstone/bin/activate &&\
        pylint --disable=R,C,W1203 app.py

all: setup install lint

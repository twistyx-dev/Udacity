## The Makefile includes instructions on environment setup and lint tests

setup:
	python3 -m venv ~/.capstone
		source ~/.capstone/bin/activate

install:
	pip install --upgrade pip==x.x.x &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for go source code: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 weather_app.py

all: install lint test

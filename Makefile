## The Makefile includes instructions on environment setup and lint tests

setup:
	python3 -m venv ~/.capstone
		source ~/.capstone/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for go source code: http://coala.rtfd.org//
	# This should be run from inside a virtualenv
	golint main.go

all: install lint test

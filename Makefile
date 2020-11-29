## The Makefile includes instructions on environment setup and lint tests
setup:
	python3 -m venv ~/.capstone
		source ~/.capstone/bin/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

build:
	docker build --build-arg APP_PORT=80 --tag=twi5tyx/capstone .

upload:
	sh ./scripts/upload_docker.sh

all: install lint test

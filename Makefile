.PHONY: setup

# Django project Makefile commands are commented

ENV=.venv
PIP=${ENV}/bin/pip
PYTHON=${ENV}/bin/python
#MANAGE=${PYTHON} manage.py

setup: virtualenv
	${PIP} install -r requirements.txt
	${PIP} install -r requirements-dev.txt
	#[ -f ".env" ] || cp .example.env .env
	#${MANAGE} migrate

#run:
#	${MANAGE} runserver

#test:
#	READ_DOT_ENV_FILE=False ${MANAGE} test

#shell:
#	${MANAGE} shell


requirements: virtualenv
	${PIP} install -r requirements-to-freeze.txt
	echo "# !!! Generated from requirements-to-freeze.txt on `date`"  > requirements.txt
	echo '# !!! Do not edit directly.'  >> requirements.txt
	echo '# !!! Add your requirements in requirements-to-freeze.txt' >> requirements.txt
	echo '# !!! and run `make requirements` to update this file.'  >> requirements.txt
	${PIP} freeze >> requirements.txt
	${PIP} install -r requirements-dev.txt

precommit:
	# In a production project, pre-commit would be installed and this would run automatically
	black .
	isort .

virtualenv:
	[ -d "${ENV}" ] && rm -rf ${ENV} || true
	python3 -m venv ${ENV}
	${PIP} install -U pip setuptools wheel

SHELL := /bin/bash
sha = $(shell "git" "rev-parse" "--short" "HEAD")

dist/spacy.pex : spacy/*.py* spacy/*/*.py*
	python3 -m venv env3.6
	source env3.6/bin/activate
	env3.6/bin/pip install wheel
	env3.6/bin/pip install -r requirements.txt --no-cache-dir 
	env3.6/bin/python setup.py build_ext --inplace
	env3.6/bin/python setup.py sdist
	env3.6/bin/python setup.py bdist_wheel

.PHONY : clean

clean : setup.py
	source env3.6/bin/activate
	rm -rf dist/*
	python setup.py clean --all

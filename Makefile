.PHONY: build test

build:
	docker build -t genepi/imputationserver .

test: build
	bash tests/test_runner.sh

default: build

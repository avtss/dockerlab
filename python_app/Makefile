.PHONY: install install-dev test run

install:
	pip install --user --no-cache-dir .

install-dev:
	pip install ".[test]"

test:
	pytest tests

run:
	uvicorn src.main:app --host 0.0.0.0 --reload

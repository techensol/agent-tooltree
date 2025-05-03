.PHONY: clean
clean:
	find . -type d -name '__pycache__' -exec rm -rf {} +; echo "Cleaning cache..."

.PHONY: install
install:
	poetry install

.PHONY: install-pre-commit
install-pre-commit:
	poetry run pre-commit uninstall; poetry run pre-commit install ; pre-commit install --hook-type commit-msg

.PHONY: lint
lint:
	poetry run pre-commit run --all-files

.PHONY: test
test:
	pytest -rP -n auto --show-capture=no

.PHONY: update
update: clean install install-pre-commit lint test;

.PHONY: coverage
coverage:
	pytest --cov=agent_tooltree --cov-report=term-missing --cov-report=html

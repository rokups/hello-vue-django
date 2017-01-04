# Use development settings for running django dev server.
export DJANGO_SETTINGS_MODULE=backend.settingsdev

# Creates python virtual environment.
venv:
	python3 -m venv .venv

# Initializes virtual environment with basic requirements.
prod: venv
	.venv/bin/pip install -r requirements.txt
	npm install --production

# Installs development requirements.
dev: venv
	.venv/bin/pip install -r requirements.txt
	.venv/bin/pip install -r requirements-dev.txt
	npm install

# Runs development server.
# This step depends on `make dev`, however dependency is excluded to speed up dev server startup.
run:
	npm run dev & .venv/bin/python ./manage runserver

# Creates migrations and migrates database.
# This step depends on `make dev`, however dependency is excluded to speed up dev server startup.
migrate:
	.venv/bin/python ./manage makemigrations
	.venv/bin/python ./manage migrate

# Builds files for distribution which will be placed in /static/dist
build: prod migrate
	.venv/bin/python ./manage makemigrations
	npm run build

# Cleans up folder by removing virtual environment, node modules and generated files.
clean:
	rm -rf .venv
	rm -rf node_modules
	rm -rf static/dist

# Run linter
lint:
	@npm run lint --silent

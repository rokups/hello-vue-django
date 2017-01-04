# Use development settings for running django dev server.
export DJANGO_SETTINGS_MODULE=backend.settingsdev

# Initializes virtual environment with basic requirements.
prod:
	pip install -r requirements.txt
	npm install --production

# Installs development requirements.
dev:
	pip install -r requirements.txt
	pip install -r requirements-dev.txt
	npm install

# Runs development server.
# This step depends on `make dev`, however dependency is excluded to speed up dev server startup.
run:
	npm run dev & python ./manage runserver

# Creates migrations and migrates database.
# This step depends on `make dev`, however dependency is excluded to speed up dev server startup.
migrate:
	python ./manage makemigrations
	python ./manage migrate

# Builds files for distribution which will be placed in /static/dist
build: prod migrate
	npm run build

# Cleans up folder by removing virtual environment, node modules and generated files.
clean:
	rm -rf node_modules
	rm -rf static/dist

# Run linter
lint:
	@npm run lint --silent

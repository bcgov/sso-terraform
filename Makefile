SHELL := /usr/bin/env bash
REALM =
CLIENT =

# see https://asdf-vm.com/#/core-manage-asdf?id=install
.PHONY: local-setup
local-setup:
	cat .tool-versions | cut -f 1 -d ' ' | xargs -n 1 asdf plugin-add || true
	asdf plugin-update --all
	asdf install
	asdf reshim
	python -m pip --version
	pip install -r requirements.txt
	pre-commit install
	gitlint install-hook

# see https://github.com/keycloak/keycloak-containers
.PHONY: dev-setup
dev-setup:
	docker-compose -f dockerfiles/keycloak-postgres.yml up

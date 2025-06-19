SHELL := /usr/bin/env bash

.PHONY: apply
apply:
	terraform init -upgrade
	terraform apply --auto-approve

.PHONY: clean
clean:
	rm -rf .terraform || true
	rm .terraform.lock.hcl || true
	rm terraform.tfstate || true

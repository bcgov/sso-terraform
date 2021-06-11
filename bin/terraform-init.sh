#!/bin/bash

pwd="$(dirname "$0")"
basedir="$pwd/../terraform"
terraform init "$basedir/keycloak-dev/realms/${realm}/client-${client}.tf"
test="$basedir/keycloak-test/realms/${realm}/client-${client}.tf"
prod="$basedir/keycloak-prod/realms/${realm}/client-${client}.tf"

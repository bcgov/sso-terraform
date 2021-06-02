#!/bin/bash

help="\
    Usages:
        $0 <realm> <client> [--dev] [--test] [--prod] or

    Available Realms:
       - onestopauth
       - onestopauth-business
       - onestopauth-basic
       - onestopauth-both

    Environments:
        --dev   Create a client in Dev environment.
        --test  Create a client in Test environment.
        --prod  Create a client in Prod environment.
    "

if [ "$#" -lt 2 ]; then
    echo -e "$help"
    exit 0
fi

available_realms=("onestopauth onestopauth-business onestopauth-basic onestopauth-both")
realm="$1"
client="$2"
export realm client

if [[ ! " ${available_realms[@]} " =~ " ${realm} " ]]; then
    echo -e "$help"
    exit 0
fi

pwd="$(dirname "$0")"
terraform="$pwd/../terraform"
example="$terraform/client.tf.example"
dev="$terraform/keycloak-dev/realms/${realm}/client-${client}.tf"
test="$terraform/keycloak-test/realms/${realm}/client-${client}.tf"
prod="$terraform/keycloak-prod/realms/${realm}/client-${client}.tf"

template=$(envsubst <"$example")

shift
shift

while [[ "$1" == -* ]]; do
    case $1 in
    -d | --dev)
        # echo "$template" >"$dev"
        echo "The client '${client}' generated in '$dev'"
        ;;
    -t | --test)
        # echo "$template" >"$test"
        echo "The client '${client}' generated in '$test'"
        ;;
    -p | --prod)
        # echo "$template" >"$prod"
        echo "The client '${client}' generated in '$prod'"
        ;;
    -h | --help)
        echo -e "$help"
        exit 0
        ;;
    esac
    shift
done

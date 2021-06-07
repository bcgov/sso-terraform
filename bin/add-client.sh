#!/bin/bash

help="\
    Usages:
        $0 <realm> <client> [--dev] [--test] [--prod] [--ci]

    Available Realms:
       - onestopauth
       - onestopauth-business
       - onestopauth-basic
       - onestopauth-both

    Environments:
        --dev   Create a client in Dev environment.
        --test  Create a client in Test environment.
        --prod  Create a client in Prod environment.

    Options:
        --ci    Set client secret to 'Pa55w0rd' for testing in CI.

    Notes:
        - Only one 'realm' can be used at a time.
        - Only one 'client' can be created at a time.
        - Multiple environment flags can be set.

    Examples:
        $ ./bin/add-client.sh onestopauth test-client --dev
        $ ./bin/add-client.sh onestopauth-basic test-client --dev --prod
        $ ./bin/add-client.sh onestopauth-both test-client --dev --test --prod --ci
    "

if [ "$#" -lt 2 ]; then
    echo -e "$help"
    exit 0
fi

available_realms=("onestopauth onestopauth-business onestopauth-basic onestopauth-both")
realm="$1"
client="$2"
export realm client

# Check if the realm is available
if [[ ! " ${available_realms[@]} " =~ " ${realm} " ]]; then
    echo -e "$help"
    exit 0
fi

# Set client secret for testing in CI
for var in "$@"; do
    if [ "$var" == "--ci" ]; then
        export extra_attr='client_secret       = "Pa55w0rd"'
    fi
done

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
        echo "$template" >"$dev"
        echo "The client '${client}' generated in '$dev'"
        ;;
    -t | --test)
        echo "$template" >"$test"
        echo "The client '${client}' generated in '$test'"
        ;;
    -p | --prod)
        echo "$template" >"$prod"
        echo "The client '${client}' generated in '$prod'"
        ;;
    -h | --help)
        echo -e "$help"
        exit 0
        ;;
    esac
    shift
done

#!/bin/bash

help="\
    Usages:
        $0 <realm> <client> or
        make add-client REALM=<realm> CLIENT=<client>

    Available Realms:
       - onestopauth
       - onestopauth-business
       - onestopauth-basic
       - onestopauth-both
    "

if [ "$#" -ne 2 ]; then
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
example="$pwd/../terraform/client.tf.example"
dev="$pwd/../terraform/dev/modules/${realm}/client-${client}.tf"
test="$pwd/../terraform/test/modules/${realm}/client-${client}.tf"
prod="$pwd/../terraform/prod/modules/${realm}/client-${client}.tf"

template=$(envsubst <"$example")
echo "$template" >"$dev"
echo "$template" >"$test"
echo "$template" >"$prod"

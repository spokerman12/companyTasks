#!/bin/bash

set -e

if [[ "$1" == "staging" ]]
then
    export TF_VAR_environment=staging
    export AWS_PROFILE=staging
fi

if [[ "$1" == "production" ]]
then
    export TF_VAR_environment=production
    export AWS_PROFILE=production
fi

# ...
# Segun tantas cuentas haya

terraform workspace select $TF_VAR_environment

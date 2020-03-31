#!/bin/sh

# The script user should define the base url (first param), otherwise we use localhost:8080
CD=${1:-"http://localhost:8080"} 
echo $CD


# Exit with error as soon as a build step fails
set -e

# 0. Have a look at our environment
echo "Node " $(node -v)
echo "npm " $(npm -v)

# 1. Launch cypress
cd integration-tests
CI=true npm ci
echo "Waiting for $CD ..."
./node_modules/wait-on/bin/wait-on $CD
./node_modules/cypress/bin/cypress run --config baseUrl=$CD --env baseAPIUrl=$CD
#!/bin/bash

export http_proxy=http://localhost:8118
export https_proxy=http://localhost:8118

export HUBUSER=
export HUBPASS=
export HUBTOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${HUBUSER}'", "password": "'${HUBPASS}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)

curl -s -H "Authorization: JWT ${TOKEN}" "https://hub.docker.com/v2/repositories/library/$1/tags/?page_size=100"\
 | jq -r '.results[] | select(.name == "latest") | .images[0].size' | numfmt --to=iec-i

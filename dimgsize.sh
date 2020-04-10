#!/bin/bash

if test -z "$2";
then
    TAG="latest"
else
    TAG="$2";
fi

export http_proxy=http://localhost:8118
export https_proxy=http://localhost:8118

RESULT=$(curl -s -H "Authorization: JWT ${TOKEN}" "https://hub.docker.com/v2/repositories/library/$1/tags/?page_size=100")
echo "$RESULT" | jq -r '.results[] | select(.name == "'$TAG'") | .images[] | select(.architecture == "amd64" and .os == "linux") | .size' | numfmt --to=iec-i

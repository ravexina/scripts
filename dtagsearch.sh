#!/bin/bash

IMAGE="$1"
QUERY="$2"

curl -s "https://hub.docker.com/v2/repositories/library/${IMAGE}/tags/?page_size=3500" | jq -r ".results[] .name" | grep "$QUERY"


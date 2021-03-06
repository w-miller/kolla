#!/bin/bash

RES=0

for dockerfile in "$@"; do
    if grep -qE '^\s+[[:upper:]]+\s+' "$dockerfile"; then
        echo "ERROR: $dockerfile has indented Dockerfile instruction" >&2
        grep -E '^\s+[[:upper:]]+\s+' "$dockerfile"
        RES=1
    fi
done

exit $RES

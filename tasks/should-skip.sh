#!/usr/bin/env bash

commitRange=${TRAVIS_COMMIT_RANGE}

# Skip if only ".md" files have been changed
git diff --name-only "$commitRange" | sed -E '/\s*.+\.md\s*/d' | wc -l

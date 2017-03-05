#!/usr/bin/env bash

# If not in a Pull Request, then never skip
if [ "$TRAVIS_PULL_REQUEST_BRANCH" = "" ]; then echo 1; exit; fi

# Skip if only ".md" files have been changed
git diff --name-only "$TRAVIS_BRANCH".."$TRAVIS_PULL_REQUEST_BRANCH" | sed -E '/\s*.+\.md\s*/d' | wc -l

#!/usr/bin/env bash

if [ "$TRAVIS_PULL_REQUEST_BRANCH" = "" ]; then echo 1; exit; fi

git diff --name-only ${TRAVIS_BRANCH}..${TRAVIS_PULL_REQUEST_BRANCH} | grep -c -E -v -e "\s*.+\.md\s*"


#!/usr/bin/env bash

baseBranch=${TRAVIS_BRANCH}
currentBranch=${TRAVIS_PULL_REQUEST_SHA}

# If not in a Pull Request, then never skip
if [ "$currentBranch" = "" ]; then echo 1; exit; fi

# Skip if only ".md" files have been changed
git diff --name-only "$baseBranch".."$currentBranch" | sed -E '/\s*.+\.md\s*/d' | wc -l

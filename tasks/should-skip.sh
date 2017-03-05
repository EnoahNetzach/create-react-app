#!/usr/bin/env bash

baseBranch=${TRAVIS_BRANCH}
currentBranch=${TRAVIS_PULL_REQUEST_BRANCH}

# If not in a Pull Request, then never skip
if [ "$currentBranch" = "" ]; then echo 1; exit; fi

# Get the name list of changed files
diff=`git diff --name-only "$baseBranch".."$currentBranch"`

# Count non-".md" files have been changed
echo diff | sed -E '/\s*.+\.md\s*/d' | wc -l

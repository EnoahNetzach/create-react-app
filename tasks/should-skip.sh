#!/usr/bin/env bash

if [ "$TRAVIS" = "true" ]; then
  commitRange=${TRAVIS_COMMIT_RANGE}
fi

if [ "$APPVEYOR" = "true" ] && [ "$APPVEYOR_PULL_REQUEST_NUMBER" != "" ]; then
  prData=`curl -s https://api.github.com/repos/${APPVEYOR_REPO_NAME}/pulls/${APPVEYOR_PULL_REQUEST_NUMBER}`
  nodeProgram="var prData = $prData;if (prData.base && prData.head) console.log(prData.base.sha + '..' + prData.head.sha);"
  echo ${nodeProgram}
  commitRange=`node -e "$nodeProgram"`
fi

echo "commit range: $commitRange"

if [ "$commitRange" = "" ]; then
  echo 1
  exit
fi

# Skip if only ".md" files have been changed
git diff --name-only "$commitRange" | sed -E '/\s*.+\.md\s*/d' | wc -l

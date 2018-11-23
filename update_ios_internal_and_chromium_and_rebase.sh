#!/usr/bin/env bash

# update ios_internal
set -x
cd src/ios_internal && git fetch && GIT_OUTPUT="$(git checkout origin/master 2>&1)"
set +x

if [ "$?" -ne "0" ]; then
  return 1
fi

# get CHROMIUM_REVISION
CHROMIUM_REVISION=$(echo $GIT_OUTPUT | awk 'NF{ print $NF }')
echo "CHROMIUM_REVISION=$CHROMIUM_REVISION"

# update chromium
set -x
cd .. && git checkout master && git fetch && git reset --hard $CHROMIUM_REVISION && git rebase-update

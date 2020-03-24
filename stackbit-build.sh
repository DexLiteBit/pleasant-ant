#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e79c3963e29fb00142a2c7b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e79c3963e29fb00142a2c7b
curl -s -X POST https://api.stackbit.com/project/5e79c3963e29fb00142a2c7b/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e79c3963e29fb00142a2c7b/webhook/build/publish > /dev/null

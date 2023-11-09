#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
set -x
cat /etc/os-release
oc config view
oc projects
python --version
pushd /tmp

SLACK_API_TOKEN=$(cat "/token/slack-api-token")
export SLACK_API_TOKEN
git clone https://github.com/openshift/svt --depth=1
pushd svt/reliability-v2
export PROW="rosa"
./start.sh -h
sleep 60
./start.sh -t $RELIABILITY_DURATION
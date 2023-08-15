#!/bin/bash

# In order to add the runner to a runner group,
# We must specify the **organization** here
# and not the repository.
REPO="anton-rs"

# Generate this token from the following url, replacing <YOUR_ORG> with your org name
# https://github.com/organizations/<YOUR_ORG>/settings/actions/runners/new?arch=x64&os=linux
REG_TOKEN="AFCNLSWYYTOTB6YI6J3RYCDE3MBOY"

# REG_TOKEN=$(curl -X POST -H "Authorization: token ${PAT_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/repos/${REPO}/actions/runners/registration-token | jq .token --raw-output)

cd /home/docker/actions-runner

mkdir ./_work


NAME="Anton_2"

# Note: A pat token may also be passed into `config.sh` via the `--pat` flag.
./config.sh \
    --url https://github.com/${REPO} \
    --token $REG_TOKEN \
    --name $NAME \
    --runnergroup Reth \
    --work "./_work" \
    --labels "size" \
    --unattended

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!

#!/bin/bash

# In order to add the runner to a runner group,
# We must specify the **organization** here
# and not the repository.
ORG="anton-rs"

# Set the working directory
WORKDIR="./_work"

# Set the name of the runner group
GROUP="Reth"

# Set the name of the runner
NAME="Anton_$(openssl rand -hex 4)"

# Set the personal access token
PAT="<YOUR_PAT>"

# Use a PAT token to generate the registration token
# Alternatively, you can generate the registration token manually at the following url:
# https://github.com/organizations/<YOUR_ORG>/settings/actions/runners/new?arch=x64&os=linux
cd /home/docker/actions-runner
mkdir $WORKDIR
REG_TOKEN=$(curl \
    -L -X POST \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $PAT" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/${ORG}/actions/runners/registration-token \
    | jq -r .token
)

# Note: A pat token may also be passed into `config.sh` via the `--pat` flag.
./config.sh \
    --url "https://github.com/${ORG}" \
    --token $REG_TOKEN \
    --name $NAME \
    --runnergroup $GROUP \
    --work $WORKDIR \
    --labels "size-chad" \
    --unattended

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!

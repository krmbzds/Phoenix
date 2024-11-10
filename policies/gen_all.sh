#!/bin/bash

jq -s '.[0] * .[1]' Linux/Policies/base-policies.json Blocklist/blocklist.json > Linux/Policies/temp.json

jq -s '.[0] * .[1]' Linux/Policies/temp.json Blocklist/cookies.json > Linux/Policies/policies.json

rm -f Linux/Policies/temp.json

jq -s '.[0] * .[1]' Linux/Policies/policies.json Policies/policies-specific.json > Policies/policies.json

jq -s '.[0] * .[1]' Linux/Policies/policies.json No-Sync/policies-specific.json > Linux/No-Sync/policies.json

jq -s '.[0] * .[1]' Linux/No-Sync/policies.json Policies/policies-specific.json > No-Sync/policies.json

jq -s '.[0] * .[1]' Linux/Policies/policies.json Personal-Policies/policies-specific.json > Linux/Personal-Policies/policies.json

jq -s '.[0] * .[1]' Linux/Personal-Policies/policies.json /Policies/policies-specific.json > Personal-Policies/temp.json

jq -s '.[0] * .[1]' Personal-Policies/temp.json Personal-Policies/enforce-updating.json > Personal-Policies/policies.json

rm -f Personal-Policies/temp.json

jq -s '.[0] * .[1]' Linux/Personal-Policies/policies.json No-Sync/policies-specific.json > Linux/Personal-Dev-Nightly-Policies/temp.json

jq -s '.[0] * .[1]' Linux/Personal-Dev-Nightly-Policies/temp.json Personal-Dev-Nightly-Policies/policies-specific.json > Linux/Personal-Dev-Nightly-Policies/policies.json

rm -f Linux/Personal-Dev-Nightly-Policies/temp.json

jq -s '.[0] * .[1]' Linux/Personal-Dev-Nightly-Policies/policies.json Policies/policies-specific.json > Personal-Dev-Nightly-Policies/temp.json

jq -s '.[0] * .[1]' Personal-Dev-Nightly-Policies/temp.json Personal-Policies/enforce-updating.json > Personal-Dev-Nightly-Policies/policies.json

rm -f Personal-Dev-Nightly-Policies/temp.json

# Replace {fedir} with the directory where Phoenix-Policies-Fedora is located, otherwise you can comment this out
cp Linux/Policies/policies.json {fedir}/standard/policies.json

cp Linux/No-Sync/policies.json {fedir}/no-sync/policies.json

cp Linux/Personal-Policies/policies.json {fedir}/personal/policies.json

cp Linux/Personal-Dev-Nightly-Policies/policies.json {fedir}/personal-dev-nightly/policies.json

# Replace {dedir} with the directory where Phoenix-Policies-Debian is located, otherwise you can comment this out
cp Linux/Policies/policies.json {dedir}/phoenix-policies/policies.json

cp Linux/No-Sync/policies.json {dedir}/phoenix-policies-no-sync/policies.json

cp Linux/Personal-Policies/policies.json {dedir}/phoenix-policies-personal/policies.json
#!/bin/bash

# Can't use JQ to get the JQ version :)
# Have to save pull from GH to protect newlines
curl -s "https://api.github.com/repos/jqlang/jq/releases/latest" -o ./jq_latest.json 
JQ_TAG=$(cat ./jq_latest.json | grep tag-name)
JQ_TAG=${JQ_TAG:15:-2}
echo $JQ_TAG
echo "Pulling JQ tag: ${JQ_TAG}"

JQ_LATEST_URL=$(cat ./jq_latest.json | grep browser_download_url | grep jq-linux-amd64)
JQ_LATEST_URL=${JQ_LATEST_URL:31:-1}
rm ./jq_latest.json
echo $JQ_LATEST_URL
curl -LJO $JQ_LATEST_URL
chmod +x ./jq-linux-amd64
mkdir -pv ~/.local/bin
mv jq-linux-amd64 ~/.local/bin/jq


#! /bin/sh

cp -a /tmp/resource_packs/. /bedrock-server/resource_packs/ 2>/dev/null
cp -a /tmp/behavior_packs/. /bedrock-server/behavior_packs/ 2>/dev/null

/bin/sh -c ./bedrock_server
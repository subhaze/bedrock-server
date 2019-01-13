#! /bin/sh

mv -v /tmp/resource_packs/* /bedrock-server/resource_packs/ 2>/dev/null
mv -v /tmp/behavior_packs/* /bedrock-server/behavior_packs/ 2>/dev/null

/bin/sh -c ./bedrock_server
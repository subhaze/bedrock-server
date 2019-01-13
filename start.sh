#! /bin/sh

mv -v /tmp/resource_packs/* /bedrock-server/resource_packs/ 2>/dev/null
mv -v /tmp/behavoir_packs/* /bedrock-server/behavoir_packs/ 2>/dev/null

/bin/sh -c ./bedrock_server
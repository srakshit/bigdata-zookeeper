#!/bin/bash

echo "Downloading and unzipping kafka-$ZOOKEEPER_VERSION"
mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred')
url="$mirror/zookeeper/zookeeper-$ZOOKEEPER_VERSION/zookeeper-$ZOOKEEPER_VERSION.tar.gz"
curl $url | tar xz -C /opt 

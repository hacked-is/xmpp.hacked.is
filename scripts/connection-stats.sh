#!/bin/bash
TMP_OUTPUT="/tmp/connection-stats.txt"
OUTPUT="/var/www/transparency.xmpp.is/connection-stats.txt"

{ echo "c2s:show()"; sleep 1; } | telnet localhost 5582 | grep -a "Total:" > "${OUTPUT}"

sed -i 's/| OK: Total: //g' "${OUTPUT}"
sed -i 's/clients/C2S connections/g' "${OUTPUT}"

sed -i '/connections/i \
Currently serving:' "${OUTPUT}"
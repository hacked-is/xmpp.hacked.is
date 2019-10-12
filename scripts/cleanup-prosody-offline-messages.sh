#!/bin/bash
# This script is used to find and delete offline messages larger than 1MB to prevent storage DoS

PROSODY_DATA_DIR="/var/lib/prosody"

# Find and delete messages over 1MB
find "${PROSODY_DATA_DIR}"/hacked%2eis/offline -name "*.list" -size +1M -delete
find "${PROSODY_DATA_DIR}"/y2qmqomqpszzryei%2eonion/offline -name "*.list" -size +1M -delete

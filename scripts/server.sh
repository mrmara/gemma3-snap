#!/bin/bash -eu

# Export the configuration for content sharing
# This must be done each time the server is started to expose the actual configuration
$SNAP/bin/write-configs.sh

engine="$(modelctl show-engine --format=json | jq -r .name)"
modelctl run "$SNAP/engines/$engine/server" --wait-for-components

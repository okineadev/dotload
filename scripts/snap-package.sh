#!/usr/bin/env bash

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
    --version)
        shift
        VERSION="$1"
        ;;
    esac
    shift
done

# Create version in snapcraft.yaml
sed -i "s/@@VERSION@@/$VERSION/g" snap/snapcraft.yaml

if [[ "{{.WORKFLOW}}" = "true" ]]; then
    sg lxd -c 'snap run snapcraft clean'
    sg lxd -c 'snap run snapcraft --verbose'
else
    snapcraft clean
    snapcraft --verbose
fi

sed -i "s/$VERSION/@@VERSION@@/g" snap/snapcraft.yaml

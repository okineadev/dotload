#!/usr/bin/env bash

VERSION=""

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
    --workflow)
        workflow="true"
        ;;
    --version)
        VERSION="$2"
        echo "$VERSION"
        ;;
    esac
    shift
done

# Create version in snapcraft.yaml
sed -i "s/@@VERSION@@/$VERSION/g" snap/snapcraft.yaml

if [[ "$workflow" = "true" ]]; then
    sg lxd -c 'snap run snapcraft clean'
    sg lxd -c 'snap run snapcraft --verbose'
else
    snapcraft clean
    snapcraft --verbose
fi

sed -i "s/$VERSION/@@VERSION@@/g" snap/snapcraft.yaml

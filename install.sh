#!/usr/bin/env bash

TEMP_DIR="/tmp/dotload-app"
CURRENT_DIR=$(pwd)

mkdir "$TEMP_DIR"
cd "$TEMP_DIR"

curl -sLO https://github.com/okineadev/dotload/releases/latest/download/dotload
chmod +x dotload
sudo ln dotload /bin/dotload

cd "$CURRENT_DIR"
rm -rf "$TEMP_DIR"

echo "Done!"

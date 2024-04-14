#!/usr/bin/env bash

TEMP_DIR="$PREFIX/tmp/dotload-app"
CURRENT_DIR=$(pwd)

mkdir "$TEMP_DIR"
cd "$TEMP_DIR"

curl -sLO https://github.com/okineadev/dotload/releases/latest/download/dotload
chmod +x dotload

if echo "$OSTYPE" | grep -qE '^linux-android.*'; then
    cp dotload "$PREFIX/bin"
else
    sudo ln dotload "$PREFIX/bin/dotload"
fi

cd "$CURRENT_DIR"
rm -rf "$TEMP_DIR"

echo "Done!"

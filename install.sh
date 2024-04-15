#!/usr/bin/env bash

write () {
    echo -e "\e[1;32m↪\e[0m $1"
}

echo ""

write "Preparing environment"
TEMP_DIR="$PREFIX/tmp/dotload-app"

mkdir "$TEMP_DIR"
cd "$TEMP_DIR"

write "Downloading executable"
curl -LO --progress-bar https://github.com/okineadev/dotload/releases/latest/download/dotload
chmod +x dotload

write "Installing"
if echo "$OSTYPE" | grep -qE '^linux-android.*'; then
    cp dotload "$PREFIX/bin"
else
    sudo ln dotload "$PREFIX/bin/dotload"
fi

write "Cleaning"
rm -rf "$TEMP_DIR"

echo -e "\n\e[1;32mDone!\e[0m"

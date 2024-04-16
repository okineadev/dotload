#!/usr/bin/env bash

echo ""

TEMP_DIR="$PREFIX/tmp"
LOG_FILE="$TEMP_DIR/dotload-installer.log"

if [[ ! -f $LOG_FILE ]]; then
    touch "$LOG_FILE"
else
    # Clear all logs
    echo "" > "$LOG_FILE"
fi

write () {
    echo -e "\e[1;32m↪\e[0m $1"
    echo -e "$1" >> "$LOG_FILE"
}

log() {
    local command="$@"
    $command 2>&1 | tee -a "$LOG_FILE"
}

cd "$TEMP_DIR"

write "\e[30m[1/3]\e[0m \e[1mDownloading executable\e[0m"
log curl -LO --progress-bar https://github.com/okineadev/dotload/releases/latest/download/dotload
log chmod +x dotload

write "\e[30m[2/3]\e[0m \e[1mInstalling\e[0m"
if echo "$OSTYPE" | grep -qE '^linux-android.*'; then
    log cp dotload "$PREFIX/bin"
else
    log sudo ln dotload "$PREFIX/bin/dotload"
fi

write "\e[30m[3/3]\e[0m \e[1mCleaning\e[0m"
log rm "$TEMP_DIR/dotload"

echo -e "\n\e[1;32mDone!\e[0m"

#!/usr/bin/env bash

TEMP_DIR="$PREFIX/tmp"
LOG_FILE="$TEMP_DIR/dotload-installer.log"

if [[ ! -f $LOG_FILE ]]; then
    touch "$LOG_FILE"
else
    # Clear all logs
    echo "" > "$LOG_FILE"
fi

normalize() {
    echo -e "$1" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"
}

write_log() {
    echo -e "\e[1;32m↪\e[0m $1"
    echo -e "$(normalize "$1")" >> "$LOG_FILE"
}

log() {
    local command="$@"
    $command 2>&1 | tee -a "$LOG_FILE"
}

step () {
    write_log "\e[30m[$1]\e[0m \e[1m$2\e[0m"
}

cd "$TEMP_DIR"

echo ""

step "1/3" "Downloading executable"
log curl -LO --progress-bar https://github.com/okineadev/dotload/releases/latest/download/dotload
log chmod +x dotload

step "2/3" "Installing"
if echo "$OSTYPE" | grep -qE '^linux-android.*'; then
    log cp dotload "$PREFIX/bin"
else
    log sudo cp dotload "$PREFIX/bin/dotload"
fi

step "3/3" "Cleaning"
log rm "$TEMP_DIR/dotload"

echo -e "\n\e[1;32mDone!\e[0m"

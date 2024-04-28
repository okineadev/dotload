#!/usr/bin/env bash

# Folder for the installation environment
TEMP_DIR="$PREFIX/tmp"
LOG_FILE="$TEMP_DIR/dotload-installer.log"

if [[ ! -f $LOG_FILE ]]; then
    # Create log file in temporary dir
    touch "$LOG_FILE"
else
    # Clear all logs
    echo "" > "$LOG_FILE"
fi

sudo="sudo"
pkgmgr=""
update="update"
install="install -y"

if echo "$OSTYPE" | grep -qE '^linux-gnu.*'; then
    if [ -f '/etc/debian_version' ]; then
        pkgmgr="apt"
    elif [ -f '/etc/arch-release' ]; then
        pkgmgr="pacman"
        install="-Sy --noconfirm"
        update="-Sy"
    fi

elif echo "$OSTYPE" | grep -qE '^darwin.*'; then
    pkgmgr="brew"
    install="install"

elif echo "$OSTYPE" | grep -qE '^linux-android.*'; then
    pkgmgr="pkg"
    sudo=""
fi

# Remove color markings from text (necessary to make logs cleaner)
normalize() {
    echo -e "$1" | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"
}

# Write the text in the log
write_log() {
    echo -e "\e[1;32m↪\e[0m $1"
    echo -e "$(normalize "$1")" >> "$LOG_FILE"
}

log() {
    local command="$@"
    # Executes the command, after which writes its output to the log
    $command 2>&1 | tee -a "$LOG_FILE"
}

step() {
    write_log "\e[30m[$1]\e[0m \e[1m$2\e[0m"
}

cd "$TEMP_DIR"

echo ""

step "1/3" "Downloading executable"
log curl -LO --progress-bar https://github.com/okineadev/dotload/releases/latest/download/dotload
# Makes the script executable
log chmod +x dotload

step "2/3" "Installing"
if ! command -v git >/dev/null; then
    step "2.1/3" "Installing git"

    if ! -n "$pkgmgr"; then
        echo "Please install git manually."
        exit 1
    else
        if [[ "$pkgmgr" == "brew" ]]; then
            if ! command -v brew >/dev/null; then
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
        fi

        $sudo $pkgmgr $install git
    fi
fi

log $sudo cp dotload "$PREFIX/bin"

step "3/3" "Cleaning"
log rm "$TEMP_DIR/dotload"

echo -e "\n\e[1;32mDone!\e[0m"

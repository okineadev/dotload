#!/usr/bin/env bash

# shellcheck disable=SC2164

# Folder for the installation environment
# shellcheck disable=SC2153
TEMP="$PREFIX/tmp"
TEMP_DIR="$TEMP/dotload-installer"
LOG_FILE="$TEMP/dotload-installer.log"
EXECUTABLE_LINK="https://github.com/okineadev/dotload/releases/latest/download/dotload"

mkdir "$TEMP_DIR"

if [[ ! -f $LOG_FILE ]]; then
    # Create log file in temporary dir
    touch "$LOG_FILE"
else
    # Clear all logs
    echo "" > "$LOG_FILE"
fi

# Modifiable prefix variable
prefix="$PREFIX"
sudo="sudo"
pkgmgr=""
update="update"
install="install -y"

# If Linux OS or msys (linux emulator on Windows)
if echo "$OSTYPE" | grep -qE '^(linux-gnu|msys).*'; then
    if [ -f '/etc/debian_version' ]; then
        pkgmgr="apt"
    elif [[ -f '/etc/arch-release' || "$OSTYPE" =~ ^msys.*$ ]]; then
        pkgmgr="pacman"
        install="-Sy --noconfirm"
        update="-Sy"

        if echo "$OSTYPE" | grep -qE '^msys.*'; then
            # Because `sudo` in msys shell (on Windows™) are useless
            sudo=""
        fi
    fi

# macOS
elif echo "$OSTYPE" | grep -qE '^darwin.*'; then
    pkgmgr="brew"
    install="install"

    # The `/bin` directory in macOS is read-only, so you need to install the binary in `/usr/local`
    # https://github.com/openstreetmap/mod_tile/issues/349#issuecomment-1784165860
    prefix="/usr/local"

# Termux
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
    # shellcheck disable=SC2124
    local command="$@"
    # Executes the command, after which writes its output to the log
    $command 2>&1 | tee -a "$LOG_FILE"
}

available() {
    command -v $1 >/dev/null
}

current_step=0
steps=3

if [[ ! $SKIP_CHECKSUM_VALIDATION == "true" ]]; then
    ((steps++))
fi


step() {
    ((current_step++))
    write_log "[$current_step/$steps] \e[1m$1\e[0m"
}

shasum_cmd=""
if available sha256; then
    shasum_cmd="sha256sum"
elif available shasum; then
    shasum_cmd="shasum -a 256"
else
    SKIP_CHECKSUM_VALIDATION="true"
    write_log "Skipping checksum validation"
fi

validate_checksum() {
    log $shasum_cmd --quiet --status -c $@
}

cd "$TEMP_DIR"

echo ""

step "Downloading executable"
log curl -LO --progress-bar "$EXECUTABLE_LINK"

if [[ ! $SKIP_CHECKSUM_VALIDATION == "true" ]]; then
    # ((steps++))
    step "Validating checksum"
    log curl -LOs "$EXECUTABLE_LINK.sha256"

    # File integrity check
    if validate_checksum dotload.sha256; then
        write_log "✅ Checksum validated"
    else
        write_log "❌ The checksum is invalid, please try again"
        write_log "    If the result is the same - report the error at this link: https://github.com/okineadev/dotload/issues/new?assignees=okineadev&labels=bug&template=bug_report.md&title=[Bug]:+invalid+checksum"

        log rm -rf "$TEMP_DIR"
        exit 1
    fi
fi

# Makes the script executable
log chmod +x dotload


if [[ -f "$prefix/bin/dotload" ]]; then
    step "Updating"
else
    step "Installing"
fi

if ! available git; then
    step "Installing dependencies"

    if [[ ! -n "$pkgmgr" ]]; then
        write_log "$pkgmgr in not defined\nPlease install \e[1mgit\e[0m manually."
        exit 1
    else
        if [[ "$pkgmgr" == "brew" ]]; then
            if ! command -v brew >/dev/null; then
                # Code from https://brew.sh/#install
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
        fi

        # shellcheck disable=SC2086
        $sudo $pkgmgr $install git
    fi
fi

log $sudo cp dotload "$prefix/bin"

step "Cleaning"
log rm -rf "$TEMP_DIR"

echo -e "\n\e[1;32mDone!\e[0m"

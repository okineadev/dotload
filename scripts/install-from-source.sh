#!/usr/bin/env bash

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

step() {
    echo -e "\e[1;32m↪\e[0m \e[30m[$1]\e[0m \e[1m$2\e[0m"
}

echo ""

step "1/1" "Installing"
if ! command -v git >/dev/null; then
    step "2/2" "Installing git"

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

$sudo cp dotload/bin/dotload "$PREFIX/bin"

echo -e "\n\e[1;32mDone!\e[0m"
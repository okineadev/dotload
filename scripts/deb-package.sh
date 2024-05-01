#!/usr/bin/env bash

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
    --workflow)
        WORKFLOW=true
        ;;
    --email)
        shift
        EMAIL="$1"
        ;;
    --fullname)
        shift
        FULLNAME="$1"
        ;;
    --version)
        shift
        VERSION="$1"
        ;;
    --changes)
        shift
        CHANGES="$1"
        ;;
    --passphrase)
        shift
        PASSPHRASE="$1"
        ;;
    --key)
        shift
        KEY="$1"
        ;;
    *)
        echo "Невідомий аргумент: $1"
        exit 1
        ;;
    esac
    shift
done

cd dotload
if [[ "$WORKFLOW" = "true" ]]; then
    export DEBEMAIL="$EMAIL"
    export DEBFULLNAME="$FULLNAME"
    dch --create --distribution noble --package dotload --newversion "$VERSION" "$CHANGES"
    debuild --no-lintian -i -p"gpg --passphrase $PASSPHRASE --pinentry-mode loopback" -k$KEY
    debuild --no-lintian -S -sa -p"gpg --passphrase $PASSPHRASE --pinentry-mode loopback" -k$KEY
else
    debuild --no-lintian -us -uc
fi

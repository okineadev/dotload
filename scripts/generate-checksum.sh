#!/usr/bin/env bash

echo "$(sha256sum "dotload/bin/dotload" | awk '{print $1}')  dotload" > dotload.sha256
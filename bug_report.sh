#!/usr/bin/env bash

LOG_FILE="$PREFIX/tmp/dotload-installer.log"

if [ ! -f "$LOG_FILE" ]; then
    echo -e "The log is missing, try to install again, then execute the command: \e[1m$0\e[0m"
    exit 1
fi

release_info="$PREFIX/etc/os-release"

os_name () {
    if [[ -f /etc/os-release ]]; then
        grep -Po '(?<=PRETTY_NAME=").*?(?=")' "$release_info"
    elif [[ "$(uname -o)" == "Android" ]]; then
        echo "Termux on Android™"
    else
        echo "$(uname -o) (Unknown)"
    fi
}

text="
DESCRIBE YOUR PROBLEM HERE!

System info:

**OS**: \`$(os_name)\`
**Architecture**: \`$(uname -p)\`
**Kernel**: \`$(uname -r)\`

<details>
    <summary>Log</summary>

\`\`\`
$(cat "$LOG_FILE")
\`\`\`
</details>

<!-- generated by bug_report.sh -->
"

link="https://github.com/okineadev/dotload/issues/new$(curl -s -o /dev/null -w %{url_effective} --get --data-urlencode "body=$text" "")&labels=bug"

echo -e "\n$link\n"
echo -e "  \e[1;32m1.\e[0m ☝️  Open this link in your browser"
echo -e "  \e[1;32m2.\e[0m Fill out the form with a description of your problem"
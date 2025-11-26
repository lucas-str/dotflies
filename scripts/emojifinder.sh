#!/bin/bash

ef() {
    echo "https://emojifinder.com/$1"
    curl -s "https://emojifinder.com/*/ajax.php?action=search&query=$1" |
        jq -r '.results | sort_by(.display_mode) | .[] | [.display_code, .Name] | join("@")' |
        while IFS=@ read CODE NAME; do
            echo -e "$(sed <<<$CODE -E 's/&#x(.*);/\\U\1/')@$(tr <<<$NAME '[:upper:]' '[:lower:]')"
        done |
        column -t -s '@'
}

ef $1

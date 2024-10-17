#!/bin/bash

filename=".bashrc"

if [ -f "$filename" ]; then
    cp "$filename" "$filename.bak"
    echo "Made backup: $filename.bak"
else
    if [[ "$1" == "-c" ]]; then
        touch "$filename"
    else
        echo "$filename does not exist. Pass \`-c\` if you want to create it"
        exit 0
    fi
fi

custom_alias_list="# Lazy ls
alias l='ls -lah --color=auto'

# Lazy z
alias c='cd'
alias c.='cd ../'
alias c..='cd ../..'
alias c...='cd ../../..'
alias c-='cd -'
"

printf "$custom_alias_list" >> "$filename"
exit 0

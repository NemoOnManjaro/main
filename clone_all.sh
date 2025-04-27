#!/bin/bash

if ! gh auth status; then
    gh auth login
fi

gh repo list NemoOnManjaro --limit 4000 | while read -r repo _; do
    dirname="${repo##*/}"
    echo "$repo -> $dirname"
    if [ -e "$dirname" ]; then
        continue
    fi

    git submodule add -b main git@github.com:${repo}.git
#    git clone git@github.com:${repo}.git
#  gh repo clone "$repo" "$repo"
done

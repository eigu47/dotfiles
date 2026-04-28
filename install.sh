#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
for dir in "$BASE_DIR"/*/; do
        dir=${dir%/}
        dir=${dir##*/}

        read -n 1 -p "stow -v -t \$HOME $@ $dir? [y/n] " ans
        echo
        if [[ "$ans" =~ ^[yY] ]]; then
                stow -v -t "$HOME" "$@" "$dir"
        else
                echo skipping "$dir"
        fi
done

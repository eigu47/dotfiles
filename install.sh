#!/usr/bin/env bash

if [[ $1 =~ (adopt|diff) ]]; then
        MODE="--adopt"
fi

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
for dir in "$BASE_DIR"/*/; do
        dir=${dir%/}
        dir=${dir##*/}

        read -n 1 -p "stow -v $MODE $dir? [y/n] " ans
        echo
        if [[ "$ans" =~ ^[yY] ]]; then
                stow -v -t "$HOME" "$MODE" "$dir"
        else
                echo skipping "$dir"
        fi
done

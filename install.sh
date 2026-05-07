#!/usr/bin/env bash

if ! command -v stow &>/dev/null; then
	echo Stow not found >&2
	exit 1
fi

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
for dir in "$BASE_DIR"/*/; do
	dir=${dir%/}
	dir=${dir##*/}

	read -r -n 1 -p "stow -v -t \$HOME $* $dir? [y/n] " ans
	echo
	if [[ "$ans" =~ ^[yY] ]]; then
		stow -v -t "$HOME" "$@" "$dir"

		case "$dir" in
		bash)
			line='[ -f ~/.bashrc.local ] && . ~/.bashrc.local'
			if ! grep -Fq "$line" ~/.bashrc; then
				cat <<-EOF >>~/.bashrc

					# Load local bashrc
					$line
				EOF

				echo Added line in bashrc
			fi
			;;
		esac
	else
		echo skipping "$dir"
	fi
done

#!/usr/bin/bash

set -euo pipefail

name=@ELECTRON@
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${name}-flags.conf"

lines=()
if [[ -f "${flags_file}" ]]; then
    mapfile -t lines < "${flags_file}"
fi

flags=()
for line in "${lines[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        flags+=("${line}")
    fi
done

exec /usr/lib/${name}/electron "${flags[@]}" "$@"

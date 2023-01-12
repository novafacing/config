#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

pushd "${SCRIPT_DIR}"

find . -type d -printf "%P\n" | grep -v -e "^.git/" | sed '/^$/d' | sort | uniq | while read dir; do mkdir -p "$HOME/$dir"; done
find . -type f -printf "%P\n" | grep -v -e "^.git/" | sed '/^$/d' | sort | uniq | while read file; do ln -s "$(pwd)/$file" "$HOME/$file"; done

popd

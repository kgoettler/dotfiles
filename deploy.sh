#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

while IFS= read -r line; do
    cmd=$(echo "$line" | cut -d',' -f1)
    file=$(echo "$line" | cut -d',' -f2)
    if [ -n $cmd ]; then
        if ! command -v $cmd &> /dev/null; then
            echo "skipping $file"
            continue
        fi
    fi
    infile="$SCRIPT_DIR/${file}"
    outfile="${HOME}/${file}"
    echo "deploying '$file' to '$outfile'"

    # Ensure directory exists
    filedir=$(dirname $file)
    if [ ! -d $filedir ]; then
        mkdir -p $filedir
    fi
    ln -sf $infile $outfile
done < "$SCRIPT_DIR/filemap.txt"


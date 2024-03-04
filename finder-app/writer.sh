#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Two arguments required"
    exit 1
fi

writefile=$1
writestr=$2
dir=$(dirname "$writefile")
filename=$(basename "$writefile")

mkdir -p "$dir" || { echo "Error: Could not create directory '$dir'" >&2 ; exit 1;}

touch "$writefile" && cat <<EOF > "$writefile" || { echo "Error: Could not write to file '$writefile'" >&2 ; exit 1;}
$writestr
EOF
exit 0

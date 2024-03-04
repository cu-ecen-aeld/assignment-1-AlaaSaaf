#!/bin/sh

if [ $# -ne 2 ]; then
    echo "Usage: ./finder-app /path/to/directory 'search_string'"
    exit 1
fi

filesdir = $1
searchstr = $2

echo ${filesdir}
if ! [ -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

count=0
for dir in "$filesdir"/*; do
    for file in "$dir"/*; do
        if [ -f "$file" ] ; then
            grep -o -r "$searchstr" "$file" >> count.txt
            count=$(($(cat count.txt | wc -l)))
        fi
    done
done

echo "The number of files are $(find "$filesdir" -type f | wc -l) and the number of matching lines are $count"
exit 0

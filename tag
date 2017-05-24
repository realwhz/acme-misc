#!/usr/bin/bash

old="$PWD"
echo $old

while [[ ! -f tags && "$PWD" != "/" ]]; do
    cd ..
done

if [[ -f tags ]]; then
    new="$PWD"
    echo $new
    readtags -t tags $1 | awk -F "\t" -v prefix="${new#$old}" '{$2 = prefix"/"$2; print $2":"$3}'
fi

#!/bin/bash

VIM_PATH=/Users/marin/.vim/bundle

(cd "$VIM_PATH"
for i in $(ls -d */);
do
    printf "Plugin: %s\t" "$i"
    (cd "$VIM_PATH/${i}"
    git pull)
done)

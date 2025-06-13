#!/bin/bash

for i in $(find . -name '.git'); do
    d=${i%.git} 
    cd $d 
    echo $d 
    git checkout master
    git checkout main
    git pull 
    cd - >/dev/null
done
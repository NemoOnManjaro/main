#!/bin/bash

for i in $(find . -name '.git'); do
    d=${i%.git} 
    cd $d 
    echo $d 
    git checkout main
    git pull 
    if [ "$(git symbolic-ref refs/remotes/origin/HEAD)" != "refs/remotes/origin/main" ]; then
        echo "ERR: default branch is not main!"
    fi
    cd - >/dev/null
done
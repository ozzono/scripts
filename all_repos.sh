#!/bin/bash

pull(){
    repo=$1
    here=$2
    echo "cloning $repo"
    git clone <repo_path>/$repo
    echo "cloned $repo"
    cd $here/$repo
    echo "fetching packages"
    go mod tidy
    go mod download
    echo "fetched packages"
    cd $here
}


declare -A test
test+="repo1 "
test+="repo2 "

for r in ${replist[@]}; do
    pull "${r}" $(pwd) &
done

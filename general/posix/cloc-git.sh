#!/usr/bin/env bash
echo "Usage: cloc-git repo-url EXTRA_ARG_TO_CLONE_1 EXTRA_ARG_TO_CLONE_2"
git clone --depth 1 "$1" temp-linecount-repo $2 $3 $4 $5 && 
  printf "('temp-linecount-repo' will be deleted automatically)\n\n\n"

cloc temp-linecount-repo &&
  rm -rf temp-linecount-repo




# https://gitlab.dev.local/bw-team/BWFRONT.git --branch DEVELOPER -c http.sslVerify=false

# https://gitlab.dev.local/bw-team/bwnode.git --branch developer -c http.sslVerify=false
# 39652

# https://gitlab.dev.local/bw-team/bwnode.git --branch developer -c http.sslVerify=false
# 
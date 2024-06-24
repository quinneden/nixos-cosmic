#!/usr/bin/env bash

if [[ -n $1 ]]; then
  if [[ $1 == */* ]]; then
    owner=$(echo "$1" | cut -f 1 -d'/')
    repo=$(echo "$1" | cut -f 2 -d'/')
    git clone git@github.com:"$owner"/"$repo" && cd $repo
  elif [[ -n $2 ]]; then
    git clone git@github.com:"$1"/"$2"
  fi
else
  echo "Error: must specify git repository."
fi

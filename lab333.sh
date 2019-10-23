#!/bin/bash

# Regex matches 7 to 40 characters of alphanumeric lowercase
# to check if we're checking out a git SHA
if [[ "$1" =~ ^[0-9a-f]{7,40}$ ]]; then
  git checkout $1
  # build and run
  docker build . -t "yahw"
  docker run yahw:latest

  # grab last output code to check docker build result
  if [[ $? != 0 ]]; then
    OUT="broken"
  else
    OUT="clean"
  fi

  echo $OUT > "helloworld_${1}.txt"
else
  echo "Error: Input does not match git commit SHA!"
  exit 1
fi

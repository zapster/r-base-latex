#!/bin/bash

# Usage: dlatex [mount point]

set -u
set -e

if [[ $# -gt 0 ]] ; then
  MNT=$(readlink -f $1)
  MY_PWD=$(pwd)
  WD="${MY_PWD#"$MNT"/}"
else
  MNT=$(pwd)
  WD=
fi

docker run --rm -it -v $MNT:/home/docker/data -w /home/docker/data/$WD docker.io/zapster/r-base-latex

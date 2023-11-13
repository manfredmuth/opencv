#!/usr/bin/bash

# Variables

# The local directory we want to share in the container
# this directory contains our images
local_dir=/home/mmuth/GIT/opencv/cascade
# The directory in our container where $local_dir will be mounted
target_dir=/cascade
container_name=opencv

podman run --rm -d -t \
  --name openCV \
  -v $local_dir:$target_dir:Z \
  $container_name




########

#podman attach openCV

#exit with CTRL-P,CTRL-Q otherwise the container will stop
#This refers to [1]

## Resources
# [1] [Troubelshoot podman terminates container on exit](https://github.com/containers/libpod/blob/master/troubleshooting.md)
########
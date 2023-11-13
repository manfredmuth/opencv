#!/usr/bin/bash

# Variables

# The local directory we want to share in the container
# this directory contains our images
local_dir=/home/mmuth/GIT/opencv/cascade
# The directory in our container where $local_dir will be mounted
target_dir=/cascade
container_name=opencv

# Check for the right Containerfile based on C_ID value

grep C_ID_openCV Containerfile >> $0
exit_code=`echo $?`
if [ $exit_code != 0 ];then
  echo "Not the right Containerfile found"
  echo "Reason might be missing file or wrong identifier C_ID"
  exit 1
fi

echo "Containerfile found - we start"

# Show the variables which are set
echo "---------------------"
echo "local_dir" $local_dir
echo "target_dir" $target_dir
echo "Container Name " $container_name

# Clean up old stuff and remove old images
echo "---------------------"
echo "INFO - Clean up - remove old images"
for i in `podman image ls -a |grep ^"<none>" |awk '{print $3}'`
  do
  podman image rm $i
done

# Create the container image
echo "---------------------"
echo "INFO - create the container image"
podman build -t $container_name .

# Set proper rights for the mount
echo "---------------------"
echo "INFO - Set proper local rights for the mount"
echo "podman unshare chown -R 0:0 " $local_dir
echo ""
podman unshare chown -R 0:0 $local_dir

########

#podman attach openCV

#exit with CTRL-P,CTRL-Q otherwise the container will stop
#This refers to [1]

## Resources
# [1] [Troubleshoot podman terminates container on exit](https://github.com/containers/libpod/blob/master/troubleshooting.md)
######### C_ID_openCV - Identifier if we have the right file

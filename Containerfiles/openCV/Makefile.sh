#!/usr/bin/bash

# Check for the right Containerfile based on C_ID value

grep C_ID_openCV Containerfile >> $0
exit_code=`echo $?`
if [ $exit_code != 0 ];then
  echo "Not the right Containerfile found"
  echo "Reason might be missing file or wrong identifier C_ID"
fi

echo "Containerfile found - we start"

#podman build -t cat/opencv .

# podman unshare chown -R 0:0 /home/mmuth/GIT/cat_prey_project/Containerfiles/openCV/cascade```

#podman run --rm -d -t \
#  --name openCV \
#  -v /home/mmuth/GIT/cat_prey_project/Containerfiles/openCV/cascade:/cascade:Z \
#  cat/opencv




########

#podman attach openCV

#exit with CTRL-P,CTRL-Q otherwise the container will stop
#This refers to [1]

## Resources
# [1] [Troubelshoot podman terminates container on exit](https://github.com/containers/libpod/blob/master/troubleshooting.md)
########

# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV
# C_ID_openCV

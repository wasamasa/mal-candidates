#!/bin/bash
GIT_TOP=$(git rev-parse --show-toplevel)
docker run -it --rm \
       --volume=${GIT_TOP}/lush:/mal \
       --volume=${GIT_TOP}/lush/.lush:/root/.lush \
       --volume=${GIT_TOP}/lush/C:/usr/share/lush/lsh/libc/C \
       lush \
       "$@"

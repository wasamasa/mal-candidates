#!/bin/bash
GIT_TOP=$(git rev-parse --show-toplevel)
docker run -e COLUMNS="`tput cols`" \
       -e LINES="`tput lines`" \
       -it --rm \
       --volume=${GIT_TOP}/lush:/mal \
       --volume=${GIT_TOP}/lush/.lush:/root/.lush \
       --volume=${GIT_TOP}/lush/C:/usr/share/lush/lsh/libc/C \
       lush \
       "$@"

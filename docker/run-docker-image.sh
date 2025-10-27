#! /bin/bash

SCRIPT_FILE="$(readlink -f "$0" 2>/dev/null || readlink "$0" 2>/dev/null || echo "$0")"
SCRIPT_DIR="${SCRIPT_FILE%/*}"

$SCRIPT_DIR/build-docker-image.sh

xhost +
docker run --rm -it \
  --net=host \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --shm-size=1g \
  ghidra/ghidra:11.4.2_PUBLIC

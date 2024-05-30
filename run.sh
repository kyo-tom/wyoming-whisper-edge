#!/usr/bin/env bash

# Exit on error.
set -e

# Run the docker image with the streaming script. Pass through any arguments.
sudo docker run \
  --runtime nvidia \
  -it \
  --rm  \
  --network host \
  --device /dev/snd \
  -v data:/data \
  whisper-inference \
  python wyoming_faster_whisper/wyoming_faster_whisper/__main__.py --model base --language en --uri 'tcp://0.0.0.0:10300' --data-dir /data --download-dir /data \
  $@

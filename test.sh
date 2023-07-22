#!/usr/bin/env bash

xhost +

nohup xdg-open http://127.0.0.1:7000/static/ > /dev/null 2>&1 &

docker run -it --rm \
--mount type=bind,source="$(pwd)/demo.py",target=/root/demo.py \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-p 7000:7000 \
chinaheyu/crocoddyl python3 /root/demo.py display plot

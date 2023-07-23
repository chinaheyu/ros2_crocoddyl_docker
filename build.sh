#!/usr/bin/env bash

# Build
docker build -t chinaheyu/crocoddyl .

# Build with http proxy
# PROXY_SERVER=172.17.0.1:7890
# docker build --build-arg HTTP_PROXY=http://$PROXY_SERVER --build-arg HTTPS_PROXY=http://$PROXY_SERVER \
# --build-arg http_proxy=http://$PROXY_SERVER --build-arg https_proxy=http://$PROXY_SERVER \
# -t chinaheyu/crocoddyl .

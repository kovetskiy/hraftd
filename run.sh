#!/bin/bash

for x in 1 2 3; do
    cmd=()
    if [[ "$x" != "$1" ]]; then
        cmd=(-join localhost:10001)
    fi
    ./hraftd \
        -id node$x \
        -haddr localhost:1000$x \
        -raddr localhost:2000$x \
        ${cmd[@]} \
        node$x > node$x.log 2>&1 &
    if [[ "$x" != "3" ]]; then
        sleep 0.5
    fi
done

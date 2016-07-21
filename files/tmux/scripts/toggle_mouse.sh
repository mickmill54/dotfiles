#!/bin/bash

value=$(tmux show -g | grep '^mouse\s' | head -n 1 | awk '{print $2}')

if [[ "${value}" == "off" ]]; then
    value="on"
else
    value="off"
fi

tmux set -g mouse "${value}" \; display "mouse: ${value}"

#!/bin/bash

# Démarre l'agent SSH si le système est basé sur systemd
if ps --no-headers -o comm 1 | grep -q systemd; then
    systemctl --user enable ssh-agent
    systemctl --user start ssh-agent
fi

#!/usr/bin/env bash

MAC=$(echo $1 | grep -y -E "mac|macos")
NIX=$(echo $1 | grep -y -E "nix|nixos")

if [[ -z $1 ]]; then
  sudo asahi-bless
elif [[ -n $1 ]] && [[ ! -z $MAC ]]; then
  sudo asahi-bless --set-boot-macos -y && echo "Boot set to MacOS."
elif [[ -n $1 ]] && [[ ! -z $NIX ]]; then
    sudo asahi-bless --set-boot 2 -y && echo "Boot set to NixOS."
else
    echo "unblessed."
fi

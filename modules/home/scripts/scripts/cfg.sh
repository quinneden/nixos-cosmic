#!/usr/bin/env bash


if [[ -n $1 ]] && [[ $1 == */* ]]; then
  FWF=$(find ~/.config/lazarus -wholename "*$1*" -type f)
  if [[ ! -f $FWF ]]; then
    echo "File not found."
  else
    micro "$FWF"
  fi
elif [[ -n $1 ]] && [[ $1 != */* ]]; then
  FF=$(find ~/.config/lazarus -name "*$1*" -type f)
  if [[ ! -f $FF ]]; then
    echo "File not found."
  else
    micro "$FF"
  fi
else
  micro $HOME/.config/lazarus/flake.nix
fi

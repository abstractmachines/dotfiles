#!/bin/bash

PROMPT='abstractmachines-bootstrap-brew'

brewinstall () {
  which brew
  status=$?
  echo "status $status"
  if [[ $status =~ 0 ]]; then 
    echo "Homebrew is already installed. Skipping."
    return
  fi
  if [[ $status =~ 1 ]]; then 
    echo "Homebrew is not yet installed."
    return
  fi

}

brewinstall
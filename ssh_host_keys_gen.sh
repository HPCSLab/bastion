#!/bin/bash

set -eux

mkdir -p /etc/ssh/keys

if [ ! -e /etc/ssh/keys/ecdsa ]; then
  ssh-keygen -t ecdsa -f /etc/ssh/keys/ecdsa -N ""
fi

if [ ! -e /etc/ssh/keys/ed25519 ]; then
  ssh-keygen -t ed25519 -f /etc/ssh/keys/ed25519 -N ""
fi

if [ ! -e /etc/ssh/keys/rsa ]; then
  ssh-keygen -t rsa -f /etc/ssh/keys/rsa -N ""
fi

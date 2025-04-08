#!/bin/bash

set -eux

if [ ! -e /etc/ssh/ssh_host_ecdsa_key ]; then
  ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
fi

if [ ! -e /etc/ssh/ssh_host_ed25519_key ]; then
  ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
fi

if [ ! -e /etc/ssh/ssh_host_rsa_key ]; then
  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
fi

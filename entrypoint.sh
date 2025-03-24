#!/bin/sh

set -eux

/usr/sbin/nscd
/usr/sbin/nslcd
/usr/sbin/sshd -E /var/log/sshd

tail -F /var/log/sshd

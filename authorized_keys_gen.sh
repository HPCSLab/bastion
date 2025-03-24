#!/bin/bash

set -eux

ADMINS=(namachan10777)

touch authorized_keys
truncate -s 0 authorized_keys

for admin in "${ADMINS[@]}"; do
  curl "https://github.com/$admin.keys" >> authorized_keys
done

echo "authorized_keys generated"

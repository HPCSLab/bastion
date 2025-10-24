#!/bin/bash

set -eux

ADMINS=(
  namachan10777 # mnakano
  onokatio # tmaruyama
  maetin0324 # rmaeda
  motorailgun # kourakata
  k5342 # ksugihara
  kotatsumuri # Shota Kawakami
  TomoYoshida-enthityDecalture # Tomo Yoshida
  TKSN0775 # Shunsuke Takeshima
  UNIQabes # Takato Abe
  shattori # Shingo Hattori
)

touch authorized_keys
truncate -s 0 authorized_keys

for admin in "${ADMINS[@]}"; do
  echo "genrate for $admin"
  curl "https://github.com/$admin.keys" >> authorized_keys
done

echo "authorized_keys generated"

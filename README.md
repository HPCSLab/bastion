# bastion

`host`ネットワークモードで、docker volumeを使いSSH鍵が配置されているvolumeを`/home`にマウントしてください。

## Build

```sh
./authorized_keys_gen.sh
docker build -t hpcslab/bastion .
```

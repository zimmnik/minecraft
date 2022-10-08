# Minecraft
## private poratble vanilla minecraft server

# Installation
podman deployment mode
### restore
```sh
docker volume create minecraft-world; docker volume ls
zstdmt -d -c minecraft-world.tar.zst | docker volume import minecraft-world - && ls -alh $(docker volume inspect minecraft-world | jq -r '.[] | .Mountpoint')
docker play kube --build --replace pod.yml; docker pod ls
sudo firewall-cmd --permanent --add-port=25565/tcp && sudo firewall-cmd --reload; sudo firewall-cmd --info-zone=public
```
### save
```sh
docker play kube --down pod.yml; docker pod ls
docker volume export minecraft-world | zstd -z - > minecraft-world-tmp.tar.zst && zstdmt -d -c minecraft-world-tmp.tar.zst | tar tf -
rm -v minecraft-world.tar.zst && mv minecraft-world-tmp.tar.zst minecraft-world.tar.zst; ls -alh .
docker volume rm minecraft-world; docker volume ls
sudo firewall-cmd --permanent --remove-port=25565/tcp && sudo firewall-cmd --reload; sudo firewall-cmd --info-zone=public
```

## podman macvlan mode
### restore
```sh
systemctl status cni-dhcp; docker network ls
docker network create -d macvlan -o parent=eno1.4 cHOME; docker network ls

cd minecraft/ && docker build -t minecraft .; docker image list | grep minecraft; cd ..

docker volume create minecraft-world; docker volume ls
zstdmt -d -c minecraft-world.tar.zst | docker volume import minecraft-world - && ls -alh $(docker volume inspect minecraft-world | jq -r '.[] | .Mountpoint')

docker container create --interactive --tty --name minecraft --network cHOME --volume minecraft-world:/opt/minecraft/world --mac-address=92:d0:c6:1b:29:33 --hostname=minecraft minecraft; docker container ls -l

docker generate systemd --new --name minecraft | tee /etc/systemd/system/container-minecraft.service && systemctl daemon-reload && systemctl status container-minecraft
systemctl enable container-minecraft --now; systemctl status container-minecraft

docker attach minecraft
#detach hotkey ctrl+p,ctrl+q
```
### save
```sh
systemctl stop container-minecraft; systemctl status container-minecraft; docker ps -a
rm -v /etc/systemd/system/container-minecraft.service && systemctl daemon-reload

docker volume export minecraft-world | zstd -z - > minecraft-world-tmp.tar.zst && zstdmt -d -c minecraft-world-tmp.tar.zst | tar tf -
rm -v minecraft-world.tar.zst && mv minecraft-world-tmp.tar.zst minecraft-world.tar.zst; ls -alh .
docker volume rm minecraft-world; docker volume ls
```


## bbr
```shell
预先准备
centos：yum install ca-certificates wget -y && update-ca-trust force-enable
debian/ubuntu：apt-get install ca-certificates wget -y && update-ca-certificates

wget -O tcpx.sh "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" && chmod +x tcpx.sh && ./tcpx.sh

不卸载内核版本

wget -O tcpx.sh "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcpx.sh" && chmod +x tcpx.sh && ./tcpx.sh

卸载内核版本

wget -O tcp.sh "https://github.com/ylx2016/Linux-NetSpeed/raw/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh 

安装bbrplus
```
## docker

```
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun 
或者
curl -sSL https://get.daocloud.io/docker | sh

systemctl start docker && systemctl enable docker

```
## docker-compose

```
curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose -v
```
# 安装
```
cd / 
yum -y install git 
git clone https://github.com/lucats1993/docker.git
```

- v2ray   

```
cd /docker/v2ray && docker-compose up -d
```

- alist

```
docker run -d --restart=always -v /docker/alist:/opt/alist/data -p 5244:5244 --name="alist" xhofe/alist:latest
```

- aria2 

```
docker run -d \
    --name aria2 \
    --restart unless-stopped \
    --log-opt max-size=1m \
    -e RPC_SECRET=ARIA2 \
    -e RPC_PORT=6800 \
    -e LISTEN_PORT=6888 \
    -v /docker/aria2/config:/config \
    -v /downloads:/downloads \
    p3terx/aria2-pro
```

- ariang 


```
docker run -d \
    --name ariang \
    --restart unless-stopped \
    --log-opt max-size=1m \
    -p 6880:6880 \
    p3terx/ariang
```


- nas-tools


```
docker run -d \
    --name nas-tools \
    --hostname nas-tools \
    -p 3000:3000   `# 默认的webui控制端口` \
    -v /docker/nastools/config:/config  `# 冒号左边请修改为你想在主机上保存配置文件的路径` \
    -v /downloads:/downloads    `# 媒体目录，多个目录需要分别映射进来` \
    -e PUID=0     `# 想切换为哪个用户来运行程序，该用户的uid，详见下方说明` \
    -e PGID=0     `# 想切换为哪个用户来运行程序，该用户的gid，详见下方说明` \
    -e UMASK=000  `# 掩码权限，默认000，可以考虑设置为022` \
    -e NASTOOL_AUTO_UPDATE=false `# 如需在启动容器时自动升级程程序请设置为true` \
    jxxghp/nas-tools
```


- jackett


```
docker run -d \
  --name=jackett \
  -e PUID=0 \
  -e PGID=0 \
  -e TZ=Asia/Shanghai \
  -e AUTO_UPDATE=true `#optional` \
  -p 9117:9117 \
  -v /docker/jackett:/config \
  -v /docker/jackett/downloads:/downloads \
  --restart unless-stopped \
  lscr.io/linuxserver/jackett:latest
```

- transmission


```
docker run -d \
      --name=transmission \
      -e PUID=0 \
      -e PGID=1000 \
      -e TZ=Asia/Shanghai \
      -p 9091:9091 \
      -p 51413:51413 \
      -p 51413:51413/udp \
      -v /docker/transmission/data:/config \
      -v /downloads:/downloads \
      -v /docker/transmission/watch:/watch \
      --restart unless-stopped \
      lscr.io/linuxserver/transmission:latest
```


 - qbittorrent


```
docker run -d \
      --name=qbittorrent \
      -e PUID=0 \
      -e PGID=1000 \
      -e TZ=Asia/Shangha \
      -e WEBUI_PORT=8080 \
      -p 8080:8080 \
      -p 6881:6881 \
      -p 6881:6881/udp \
      -v /docker/qbittorrent/config:/config \
      -v /downloads:/downloads \
      --restart unless-stopped \
      lscr.io/linuxserver/qbittorrent:latest
```


 - prowlarr


```
docker run -d \
      --name=prowlarr \
      -e PUID=997 \
      -e PGID=994 \
      -e TZ=Asia/Shanghai \
      -p 9696:9696 \
      -v /docker/prowlarr:/config \
      --restart unless-stopped \
      lscr.io/linuxserver/prowlarr:develop
```

 - jellyfin

```
docker run -d --name jellyfin --restart=always -p 8096:8096 -p 8920:8920 --device /dev/dri:/dev/dri -v /docker/jellyfin/config:/config -v /docker/jellyfin/cache:/cache -v /media:/media -e TZ=Asia/Shanghai  nyanmisaka/jellyfin:latest
```


 - aliyundrive-webdav

```
docker run -d --name=aliyundrive-webdav --restart=unless-stopped -p 38080:8080 \
      -v /etc/aliyundrive-webdav/:/etc/aliyundrive-webdav/ \
      -e REFRESH_TOKEN='b88cd8e52e0e4566b63111e3effc4380' \
      -e WEBDAV_AUTH_USER=admin \
      -e WEBDAV_AUTH_PASSWORD=admin123 \
      messense/aliyundrive-webdav
```

      
 初始管理员账号：admin@cloudreve.org
[Info]    2022-08-18 15:54:38 初始管理员密码：gpCNqxbV
  export P2P_EMAIL="w1459435619@gmail.com"; 



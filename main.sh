#!/usr/bin/env bash

yum install ca-certificates wget git -y && update-ca-trust force-enable

installdocker() {
    echo "检查Docker是否已安装……"
    docker -v
    if [ $? -ne  0 ]; then
        echo "检测到Docker未安装！"
        echo
        echo " ***** 开始安装 docker 工具 ***** "
        curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
        systemctl start docker && systemctl enable docker
        echo " ***** 安装 docker 工具完成 ***** "
    else
        echo "docker 已安装！"
    fi
}

installdockercompose() {
    echo "检查docker-compose是否已安装……"
    docker-compose -v
    if [ $? -ne  0 ]; then
        echo "检测到docker-compose未安装！"
        echo
        echo " ***** 开始安装 docker-compose 工具 ***** "
        curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
        docker-compose -v
        echo " ***** 安装 docker-compose 工具完成 ***** "
    else
        echo "docker-compose 已安装！"
    fi
}

myPath="/docker"

if [ ! -d "$myPath"]; then
    git clone https://github.com/lucats1993/docker.git
fi


if [[ -n $(docker ps -q -f "name=^v2ray") ]];then
	echo "v2ray 已安装！"
else
    echo "检测到v2ray未安装！"
    cd /docker/v2ray && docker-compose up -d
    echo " ***** 安装 v2ray 工具完成 ***** "
fi

installdockercontainer(){
    if [[ -n $(docker ps -q -f "name=^${name}") ]];then
        echo "${name} 已安装！"
    else
        echo -e "检测到${name}未安装！"
        cd /docker/${name} && docker-compose up -d
        echo " ***** 安装 ${name} 工具完成 ***** "
    fi
}

installdockercontainer "v2ray"
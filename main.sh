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
    if [ $? -ne 0 ]; then
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

clonedocker(){
    if [ -d "$myPath" ]; then
        echo -e "检测到${myPath}已克隆！"
        cd $myPath && git pull
    else
        echo -e "检测到${myPath}未克隆！"
        cd / && git clone https://github.com/lucats1993/docker.git
    fi

}

installdockercontainer(){
    for i in "$@"; do
        if [[ -n $(docker ps -q -f "name=^$i$") ]];then
            echo "容器 $i 已安装！"
        else
            echo -e "容器 $i 未安装！"
            cd $myPath/$i && docker-compose up -d
            echo " ***** 安装 $i 容器完成 ***** "
        fi
    done
}

myPath="/docker"
installdocker && installdockercompose
clonedocker
installdockercontainer "v2ray" "alist"
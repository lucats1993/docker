#!/usr/bin/env bash
installdockercontainer(){
    if [[ -n $(docker ps -q -f "name=^$1$") ]];then
        echo "$1 已安装！"
    else
        echo -e "检测到$1未安装！"
        cd /docker/$1 && docker-compose up -d
        echo " ***** 安装 $1 工具完成 ***** "
    fi
}

installdockercontainer "v2ray"
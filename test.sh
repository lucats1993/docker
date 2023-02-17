#!/usr/bin/env bash
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
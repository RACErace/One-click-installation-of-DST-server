#!/bin/bash
# ==========================================================
# Don’t Starve Together Dedicated Server
# Ubuntu 22.04 一键安装脚本 (步骤 1, 2, 3)
# ==========================================================

set -e

# 颜色输出
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}[1/3] 更新系统并安装依赖...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install -y lib32gcc-s1 lib32stdc++6 screen curl wget tar unzip

echo -e "${GREEN}[2/3] 安装 SteamCMD...${NC}"
mkdir -p ~/steamcmd && cd ~/steamcmd
if [ ! -f "steamcmd.sh" ]; then
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
    tar -xvzf steamcmd_linux.tar.gz
else
    echo "steamcmd 已存在，跳过下载。"
fi

echo -e "${GREEN}[3/3] 安装 DST 服务端...${NC}"
cd ~
mkdir -p ~/dstserver
~/steamcmd/steamcmd.sh +login anonymous +force_install_dir ~/dstserver +app_update 343050 validate +quit

echo -e "${GREEN}安装完成！${NC}"
echo "DST 服务器文件目录: ~/dstserver"
echo "SteamCMD 目录: ~/steamcmd"
echo "下一步：配置 token 与 cluster.ini/server.ini 后即可启动。"

#!/bin/bash

set -e
# hce
sudo yum -y update & yum -y upgrade

# ubuntu
# apt-get -y update
# export DEBIAN_FRONTEND=noninteractive
# apt-get -y -o Dpkg::Options::="--force-confold" dist-upgrade
cd /opt

# 安装jdk
wget https://download.java.net/java/GA/jdk21/fd2272bbf8e04c3dbaee13770090416c/35/GPL/openjdk-21_linux-aarch64_bin.tar.gz
tar -xf openjdk-21_linux-aarch64_bin.tar.gz
echo 'export JAVA_HOME=/opt/jdk-21' | sudo tee -a /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile
source /etc/profile

# 安装git
# hce
dnf -y install git
# ubuntu
# apt -y install git

# 安装maven
wget https://repo.huaweicloud.com/apache/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -xf apache-maven-3.9.6-bin.tar.gz
sudo mv apache-maven-3.9.6 maven
echo 'export MAVEN_HOME=/opt/maven' | sudo tee -a /etc/profile
echo 'export PATH=$MAVEN_HOME/bin:$PATH' | sudo tee -a /etc/profile
source /etc/profile

# 安装shardingproxy
# 安装会慢
wget https://github.com/alibaba/nacos/releases/download/3.0.1.1/nacos-server-3.0.1.1.tar.gz
tar -xf nacos-server-3.0.1.1.tar.gz
cd nacos

# 定义配置文件路径
CONFIG_FILE="conf/application.properties"

# 1. 注释 nacos.core.auth.plugin.nacos.token.secret.key
sed -i 's/^nacos.core.auth.plugin.nacos.token.secret.key=/#nacos.core.auth.plugin.nacos.token.secret.key=/' "$CONFIG_FILE"


# 2. 取消 nacos.core.auth.plugin.nacos.token.secret.key 的注释
sed -i 's/^#nacos.core.auth.plugin.nacos.token.secret.key=VGhpc0lzTXlDdXN0b21TZWNyZXRLZXkwMTIzNDU2Nzg=/nacos.core.auth.plugin.nacos.token.secret.key=VGhpc0lzTXlDdXN0b21TZWNyZXRLZXkwMTIzNDU2Nzg=/' "$CONFIG_FILE"

# 3. 设置 nacos.core.auth.server.identity.key
sed -i 's/^nacos.core.auth.server.identity.key=.*/nacos.core.auth.server.identity.key=test/' "$CONFIG_FILE"

# 4. 设置 nacos.core.auth.server.identity.value
sed -i 's/^nacos.core.auth.server.identity.value=.*/nacos.core.auth.server.identity.value=test/' "$CONFIG_FILE"

# 输出修改结果
echo "Nacos configuration has been modified:"


sudo tee /etc/systemd/system/nacos.service <<-'EOF'
[Unit]
Description=nacos Server
After=network.target

[Service]
Type=forking
Environment="JAVA_HOME=/opt/jdk-21"
WorkingDirectory=/opt/nacos/bin
ExecStart=/bin/bash startup.sh -m standalone
User=root
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# 重新加载Systemd
sudo systemctl daemon-reload
# 启用开机启动
sudo systemctl enable nacos
# 重启服务
sudo systemctl start nacos
# 查看状态
sudo systemctl status nacos

passwd -d root
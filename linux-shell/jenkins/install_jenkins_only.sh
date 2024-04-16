#!/bin/bash

# 安装 Jenkins 脚本（已有 Java 17）
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/redhat-stable/jenkins-2.401.1-1.1.noarch.rpm --no-check-certificate

#安装
rpm -ivh jenkins-2.401.1-1.1.noarch.rpm

修改配置文件

```bash
vim /etc/sysconfig/jenkins
####修改启动用户和配置jenkins目录
```
######刷新配置
systemctl daemon-reload

mkdir -p /home/jenkins
chown -R root:root /var/log/jenkins
chown -R root:root /var/cache/jenkins

/etc/init.d/jenkins start
ln -s /home/jdk-17/bin/java /usr/bin/java
yum install fontconfig -y
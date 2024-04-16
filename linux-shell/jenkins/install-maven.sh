#!/bin/bash

# 定义 Maven 版本和下载链接
MAVEN_VERSION="3.9.6"
MAVEN_URL="https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz"

# 设置 Maven 安装目录
MAVEN_HOME="/usr/local/apache-maven-${MAVEN_VERSION}"

# 创建安装目录
sudo mkdir -p "${MAVEN_HOME}"

# 下载 Maven 压缩包并解压到安装目录
echo "Downloading Maven ${MAVEN_VERSION}..."
sudo wget -qO /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz "${MAVEN_URL}"
sudo tar -xzf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/local/
sudo rm -f /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz

# 配置 Maven 环境变量
echo "Configuring Maven environment variables..."
echo "export M2_HOME=${MAVEN_HOME}" | sudo tee -a /etc/profile.d/maven.sh
echo 'export PATH=${M2_HOME}/bin:${PATH}' | sudo tee -a /etc/profile.d/maven.sh

# 加载环境变量
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh

# 输出安装信息
echo "Maven ${MAVEN_VERSION} installed successfully!"
echo "Maven home: ${MAVEN_HOME}"
echo "Maven version:"
mvn --version
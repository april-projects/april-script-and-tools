#!/bin/bash

# 定义 Java 程序的相关信息
APP_NAME="codegen"  # Java 服务的名称，与安装脚本中的 APP_NAME 对应

# 停止并禁用服务
stop_and_disable_service() {
    echo "Stopping and disabling ${APP_NAME} service..."
    systemctl stop "${APP_NAME}.service"
    systemctl disable "${APP_NAME}.service"
}

# 移除服务单元文件
remove_service_file() {
    SERVICE_FILE="/etc/systemd/system/${APP_NAME}.service"
    
    echo "Removing ${SERVICE_FILE}..."
    rm -f "$SERVICE_FILE"
}

# 主函数，执行停止服务和删除服务单元文件的操作
main() {
    # 停止并禁用服务
    stop_and_disable_service
    
    # 移除服务单元文件
    remove_service_file
    
    echo "Java service '${APP_NAME}' has been uninstalled."
}

# 执行主函数
main

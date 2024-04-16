#!/bin/bash

# 定义 Java 程序的相关信息
JAVA_BIN="java"  # Java 可执行文件路径
APP_JAR="/usr/local/codegen/ballcat-codegen.jar"  # Java 应用程序的 JAR 文件路径
APP_NAME="codegen"  # 服务名称，用于 Systemd 服务单元文件
APP_DESCRIPTION="codegen"  # 服务描述
APP_USER="root"  # 运行服务的用户名，建议使用非特权用户

# 创建 Systemd 服务单元文件
create_service_file() {
    SERVICE_FILE="/etc/systemd/system/${APP_NAME}.service"

    cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=${APP_DESCRIPTION}
After=network.target

[Service]
User=${APP_USER}
WorkingDirectory=$(dirname "${APP_JAR}")
ExecStart=${JAVA_BIN} -jar "${APP_JAR}"
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF

    echo "Systemd service unit file created: ${SERVICE_FILE}"
}

# 启用并启动服务
enable_and_start_service() {
    # 刷新 Systemd 配置
    systemctl daemon-reload

    # 启用服务，加入到系统启动项
    systemctl enable "${APP_NAME}.service"

    # 启动服务
    systemctl start "${APP_NAME}.service"

    # 检查服务状态
    systemctl status "${APP_NAME}.service"
}

# 主函数，执行创建和启用服务的操作
main() {
    # 创建 Systemd 服务单元文件
    create_service_file

    # 启用并启动服务
    enable_and_start_service
}

# 执行主函数
main
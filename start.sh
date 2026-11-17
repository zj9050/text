#!/usr/bin/env bash
# TRADIS 一键启动（命令行方式）；端口 10003
set -euo pipefail
cd "$(dirname "$0")"
[ -f .env ] || { echo "错误：缺少 .env 文件"; exit 1; }
chmod 600 .env
echo "==> 拉取官方镜像 coracoo/tradis:latest"
docker compose pull
echo "==> 启动 TRADIS（面板端口 10003）"
docker compose up -d
echo "==> 当前状态"
docker compose ps
echo "访问 http://<飞牛NAS的IP>:10003 ，账号 admin，初始密码见 .env 或《部署说明.md》"

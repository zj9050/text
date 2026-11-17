#!/usr/bin/env bash
# TRADIS 更新：先备份 .env 与 data，再拉取新镜像并重建容器
set -euo pipefail
cd "$(dirname "$0")"
stamp=$(date +%Y%m%d%H%M%S)
echo "==> 备份 .env 与 data（后缀 $stamp）"
cp -a .env ".env.bak.$stamp"
cp -a data "data.bak.$stamp"
echo "==> 拉取新镜像并更新容器"
docker compose pull
docker compose up -d
docker compose ps
echo "更新完成。若异常，可用 .env.bak.$stamp 与 data.bak.$stamp 回滚；更新前请查看镜像发布说明。"

#!/bin/bash
export ipaddr=$(hostname -i)
mkdir -p /srv/gitlab/{config,logs,data}
docker compose build --no-cache
mkdir -pv ./hidden
mkdir -pv ./configs
chmod 700 ./hidden
chmod 700 ./configs
docker compose up -d
cat ./hidden/hostname

#!/bin/bash
export ipaddr=$(hostname -i)
mkdir -p /srv/gitlab/{config,logs,data}
docker compose build --no-cache
mkdit -pv ./hidden
chmod 700 ./hidden
docker compose up -d
cat ./hidden/hostname

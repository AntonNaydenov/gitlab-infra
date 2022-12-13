# gitlab-infra
mkdir -p /srv/gitlab/{config,logs,data}	

docker compose build --no-cache		

docker compose up -d		

# Для переноса на новый сервер
	перенести содержимое каталога /srv/gitlab/ на новый сервер
    перенести содержимое ./persistent для сохранения доменного имени


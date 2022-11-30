# gitlab-infra
mkdir -p /srv/gitlab/{config,logs,data}	

docker compose build --no-cache		

docker compose up -d		

# Для плучения имени тор сервиса	
docker exec gitlab-infra-tor-1 cat /var/lib/tor/hidden_service/hostname	

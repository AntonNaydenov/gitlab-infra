### Directory structure
```
---compose.yml
---tor
------Dockerfile
------readme.md(this file)
------run.sh
---persistent
------services
------.env
------hidden
```

### Required ENV variables (persistent/.env file):
* PROJECT - name of service. Used by mkp224o to generate address
proj

### persistent/services file example
```
HiddenServicePort 80 news:80
HiddenServicePort 443 news:443
```

### compose.yml example
```
version: '3.6'
services:
  news:...
  tor:
    build: ./tor
    volumes:
      - ./persistent:/persistent
    ports:
      - "443:443"
      - "80:80"
    env_file:
      - persistent/.env
    depends_on:
      - news
    healthcheck:
      test: [ "CMD", 'tor', 'alive' ]
      interval: 10s
      timeout: 3s
      retries: 4
    links:
      - news
```
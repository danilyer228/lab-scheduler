compose:=docker-compose -f $(CURDIR)/docker/docker-compose.yml

build:
	-rm $(CURDIR)/docker/crontab/crontabs/jovyan
	cp -n $(CURDIR)/.env.example $(CURDIR)/.env
	touch $(CURDIR)/docker/crontab/crontabs/jovyan
	$(compose) build 

up:
	$(compose) up --detach

down:
	$(compose) down

exec:
	docker exec -it	jupyter-lab /bin/bash

exec-cron:
	docker exec -it	jupyter-cron /bin/bash

hash-pass:
	docker exec -it jupyter-lab python3 -c "from notebook.auth import passwd; print(passwd('$(PASSWORD)'))"

all: build up

.PHONY: build
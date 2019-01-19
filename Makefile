#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
include .make/Makefile.inc

NS          := default
NAME	    := mateothegreat/docker-alpine-mysql-client
ALIAS	    ?= docker-alpine-mysql-client
VERSION	    ?= 1.0.2
IMAGE       := $(NAME):$(VERSION)
APP			?=

clean:

	rm -rf out
	mkdir -p out/hls/stream_high

build:

	docker build -t $(IMAGE) .

push:

	docker push $(IMAGE)

shell:

	docker exec -it nginx-rtmp sh

run:

	docker run --rm -it $(IMAGE) sh

down:

	docker-compose down

up:

	docker-compose up -d

restart: down clean up

logs:

	kubectl logs -f `kubectl get pod | grep mysql | awk -F ' ' '{print $1}'`

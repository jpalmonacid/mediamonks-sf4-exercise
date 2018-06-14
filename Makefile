#!/usr/bin/make -f

SHELL = /bin/sh

.PHONY: shell
shell:
	docker run -v $(PWD):/home/blog/app -u blog -it --rm --name blog-sf4-shell blog-sf4-app /bin/sh

.PHONY: build
build:
	docker build --rm -t blog-sf4-app:latest -f docker/php/Dockerfile .

.PHONY: server
server:
	docker run -d -p 8000:8000 -v $(PWD):/home/blog/app -u blog --name blog-sf4-app-running blog-sf4-app

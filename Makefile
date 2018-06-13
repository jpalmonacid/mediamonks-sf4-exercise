#!/usr/bin/make -f

SHELL = /bin/sh

.PHONY: shell
shell:
	docker run -p 8000:8000 -v $(PWD):/home/blog/app -u blog -it --rm --name running-blog-sf4-app blog-sf4-app /bin/sh

.PHONY: build
build:
	docker build --rm -t blog-sf4-app:latest -f docker/php/Dockerfile .

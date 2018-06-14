#!/usr/bin/make -f

SHELL = /bin/sh

.PHONY: shell
shell:
	docker run -v $(PWD):/home/blog/app -u blog -it --rm --name blog-sf4-shell blog-sf4-app /bin/sh

.PHONY: build
build:
	docker build --rm -t blog-sf4-app:latest -f docker/php/Dockerfile .

.PHONY: server-up
server-up:
	docker run -d -p 8000:8000 -v $(PWD):/home/blog/app -u blog --name blog-sf4-app-running blog-sf4-app

.PHONY: server-down
server-down:
	@printf 'Checking if container exists: '
	@docker inspect blog-sf4-app-running > /dev/null 2>&1 \
		|| (echo "Server container doesn't exist. Try make server-up" \
		&& exit 1)
	@echo Yes!
	@printf 'Stopping server container: '
	@docker stop blog-sf4-app-running
	@printf 'Removing server container: '
	@docker rm blog-sf4-app-running

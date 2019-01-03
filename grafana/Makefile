all: push

##### VARIABLES #####
user ?= davyj0nes
dockerbuild = docker build --no-cache -t

AWS_REGION ?= eu-west-1

##### BUILD #####
.PHONY: build
build:
	$(call blue, "# Building grafana Image...")
	${dockerbuild} ${user}/grafana .

.PHONY: push
push: build
	$(call blue, "# Pushing grafana Image...")
	@docker push docker.io/${user}/grafana:latest

##### RUN ######
.PHONY: run
run:
	$(call blue, "# Starting Grafana...")
	docker run --rm -d -p 3000:3000 --name grafana-${user} \
	-e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
	-e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
	-e "AWS_SESSION_TOKEN=${AWS_SESSION_TOKEN}" \
	-e "AWS_REGION=${AWS_REGION}" \
	${user}/grafana 

##### HELPER FUNCTIONS #####
define blue
	@tput setaf 4
	@echo $1
	@tput sgr0
endef

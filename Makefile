all: build_all

# This Makefile contains some convenience commands for creating the required Docker images

# For example, to build all the images you can just run:
# $ make

##### VARIABLES #####
user ?= davyj0nes
dockerbuild = docker build --no-cache -t
terraform_version ?= light
packer_version ?= light
app = dcmd
app_version ?= 0.1
goversion ?= 1.9
go_build_cmd = go get && GOOS=darwin GOARCH=amd64 go install

# Needed to not have make thing these are directories
.PHONY: awscli git vim zsh pytest doom terraform12

##### BUILD STEPS #####
awscli:
	$(call blue, "# Building awscli Image...")
	${dockerbuild} ${user}/awscli awscli/

git:
	$(call blue, "# Building git Image...")
	${dockerbuild} ${user}/git git/

vim:
	$(call blue, "# Building vim Image...")
	${dockerbuild} ${user}/vim vim/

zsh:
	$(call blue, "# Building zsh Image...")
	${dockerbuild} ${user}/zsh zsh/

pytest:
	$(call blue, "# Building pytest Image...")
	${dockerbuild} ${user}/pytest pytest/

firefox:
	$(call blue, "# Building Firefox Image...")
	${dockerbuild} ${user}/firefox firefox/

doom:
	$(call blue, "# Building Doom Image...")
	${dockerbuild} ${user}/doom doom/

travis_cli:
	$(call blue, "# Building travis Image...")
	${dockerbuild} ${user}/travis travis-cli/

terraform:
	$(call blue, "# Pulling Terraform Image...")
	docker pull hashicorp/terraform:${terraform_version}
packer:
	$(call blue, "# Pulling Packer Image...")
	docker pull hashicorp/packer:${packer_version}

squid:
	$(call blue, "# Pulling Squid Image...")
	docker pull datadog/squid


dcmd_install:
	$(call blue, "# Installing dcmd...")
	docker run --rm -it -v "$(CURDIR)/dcmd":/go/src/app -w /go/src/app golang:${goversion} sh -c '${go_build_cmd}'

build_all: awscli git vim zsh pytest terraform12 terraform packer squid firefox dcmd_install

push: awscli git zsh pytest firefox doom travis_cli
	$(call blue, "# Pushing awscli Image...")
	@docker push docker.io/${user}/awscli:latest
	$(call blue, "# Pushing git Image...")
	@docker push docker.io/${user}/git:latest
	$(call blue, "# Pushing vim Image...")
	@docker push docker.io/${user}/vim:latest
	$(call blue, "# Pushing zsh Image...")
	@docker push docker.io/${user}/zsh:latest
	$(call blue, "# Pushing pytest Image...")
	@docker push docker.io/${user}/pytest:latest
	$(call blue, "# Pushing firefox Image...")
	@docker push docker.io/${user}/firefox:latest
	$(call blue, "# Pushing doom Image...")
	@docker push docker.io/${user}/doom:latest
	$(call blue, "# Pushing travis Image...")
	@docker push docker.io/${user}/travis:latest

##### HELPER FUNCTIONS #####
define blue
	@tput setaf 4
	@echo $1
	@tput sgr0
endef

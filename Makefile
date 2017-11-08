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
.PHONY: awscli git vim zsh

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

terraform:
	$(call blue, "# Pulling Terraform Image...")
	docker pull hashicorp/terraform:${terraform_version}

packer:
	$(call blue, "# Pulling Packer Image...")
	docker pull hashicorp/packer:${packer_version}

firefox:
	$(call blue, "# Pulling Jess' Firefox Image...")
	docker pull jess/firefox

dcmd_install:
	$(call blue, "# Installing dcmd...")
	docker run --rm -it -v "$(CURDIR)/dcmd":/go/src/app -w /go/src/app golang:${goversion} sh -c '${go_build_cmd}'

build_all: awscli git vim zsh terraform packer firefox dcmd_install

##### HELPER FUNCTIONS #####
define blue
	@tput setaf 4
	@echo $1
	@tput sgr0
endef

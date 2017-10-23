# App:     DavyJ0nes/vim
# Author:  DavyJ0nes
# Github:  https://github.com/davyj0nes/
#

#------------ DEFAULT ------------#
all: build

#----------- VARIABLES -----------#
user = davyj0nes
name = vim
version = 

#---------- BUILD STEPS ----------#
build: check_version
	$(call blue, "# Building Vim Image...")
	docker build -t ${user}/${name} .
	docker tag ${user}/${name}:latest ${user}/${name}:${version}

run:
	$(call blue, "# Starting Vim...")
	docker run -it -v "$(CURDIR)":/srv/app ${name}:latest

#---------- HELP FUNCS -----------#
check_version:
ifndef version
	$(error version is undefined)
endif

define blue
	@tput setaf 4
	@echo $1
	@tput sgr0
endef

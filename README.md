# Dockerfiles

## Description

This is a collection of tools that I have either dockerized or nicked from elsewhere. I then wrapped all this together within a go cli app to make it easier to call.

## Motivation

This came from a personal desire to see if it was possible to run most of my tools within docker. I wrote a pretty god awful Golang CLI app to wrap this all together and that is what `dcmd` is.

## List of Applications/Tools that are included

- [awscli](https://hub.docker.com/r/davyj0nes/awscli/)
- [git](https://hub.docker.com/r/davyj0nes/git/)
- [vim](https://hub.docker.com/r/davyj0nes/vim/)
- [zsh](https://hub.docker.com/r/davyj0nes/zsh/)
- [pytest](https://hub.docker.com/r/davyj0nes/pytest/)
- [terraform](https://hub.docker.com/r/hashicorp/terraform/)
- [packer](https://hub.docker.com/r/hashicorp/packer/)
- [firefox](https://hub.docker.com/r/jess/firefox/)
- [jsonnet](https://hub.docker.com/r/davyj0nes/jsonnet/)
- [jb](https://hub.docker.com/r/davyj0nes/jb/)

## Usage

### Install and Pull everything

```shell
make build_all
```

### dcmd tool

Essentially the dcmd script is a wrapper around the `docker` command to run tools within containers

```shell
# Run vim in current directory
dcmd vim

# Run git status (all other git commands will work)
dcmd git status
```

## License
MIT


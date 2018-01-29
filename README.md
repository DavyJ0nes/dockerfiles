# Davy Dockerfiles

## Description

This is a collection of tools that I have either dockerized or nicked from elsewhere. I then wrapped all this together within a go cli app to make it easier to call.

## Motivation

This came from a personal desire to see if it was possible to run most of my tools within docker. I wrote a pretty god awful Golang CLI app to wrap this all together and that is what `dcmd` is.

## List of Applications/Tools that are included

- awscli
- git
- vim
- zsh
- pytest
- terraform
- packer
- firefox

## Usage

### Install and Pull everything

```
make build_all
```

## License
MIT


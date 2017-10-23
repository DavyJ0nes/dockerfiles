FROM alpine:3.6
LABEL NAME=DavyJ0nes/git
LABEL Version=0.0.1
LABEL Author=DavyJ0nes

RUN apk update && apk add git
RUN mkdir -p /srv/app

WORKDIR /srv/app

ENTRYPOINT ["git"]

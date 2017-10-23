FROM alpine:3.6
LABEL NAME=DavyJ0nes/awscli
LABEL Version=0.0.1
LABEL Author=DavyJ0nes

RUN apk update && apk add python3-dev
RUN pip3 install awscli

RUN mkdir -p /srv/app

WORKDIR /srv/app

ENTRYPOINT ["aws"]

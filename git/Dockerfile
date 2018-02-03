FROM alpine:3.6
LABEL NAME=davyj0nes/git
LABEL Version=0.0.1
LABEL Author=DavyJ0nes

RUN apk update && apk add git
RUN mkdir -p /src/app

WORKDIR /src/app

ENTRYPOINT ["git"]

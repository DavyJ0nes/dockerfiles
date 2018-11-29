FROM ruby:alpine
LABEL NAME=davyj0nes/vim
LABEL Version=0.0.1
LABEL Author=DavyJ0nes

RUN apk add --no-cache build-base git && \
    gem install travis && \
    gem install travis-lint && \
    gem install travis-conditions && \
    apk del build-base &&\
    mkdir project

ENTRYPOINT ["travis"]

FROM alpine:3.6
LABEL NAME=davyj0nes/vim
LABEL Version=0.0.1
LABEL Author=DavyJ0nes

RUN apk update && apk add vim
RUN mkdir -p /src/app
ADD .vimrc /root/.vimrc
ADD .vim/ /root/.vim/
WORKDIR /src/app

RUN vim -E -c 'execute pathogen#helptags()' -c q ; return 0
ENV TERM=xterm-256color

ENTRYPOINT ["vim"]

FROM node:lts-slim

LABEL maintainer=davyj0nes
LABEL name=ng

RUN apt-get update && apt-get install -qqy --no-install-recommends \
    dumb-init \
    git \
    build-essential \
    python \
    procps \
    rsync \
    openssh-client \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g @angular/cli && \
    npm install -g yarn

WORKDIR /app

EXPOSE 4200

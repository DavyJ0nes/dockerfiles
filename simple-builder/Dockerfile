FROM alpine:3.6
LABEL Name=simple-builder
LABEL Author=davyj0nes

RUN apk add --no-cache curl ca-certificates

RUN curl -L -o /bin/yq "https://github.com/mikefarah/yq/releases/download/2.2.0/yq_linux_amd64" && chmod +x /bin/yq

RUN apk add --no-cache bash openssh git jq

ENV SHELL /bin/bash

ENTRYPOINT [ "bin/bash" ]

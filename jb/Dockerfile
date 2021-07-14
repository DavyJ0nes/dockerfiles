FROM sparkprime/jsonnet AS Source

FROM golang:1.15-alpine3.12 As Builder

RUN apk --no-cache add git

RUN go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb

FROM alpine:3.12

LABEL MAINTAINER=davyj0nes

RUN apk --no-cache add bash git jq libstdc++
COPY --from=Source /usr/local/bin/jsonnet usr/local/bin/jsonnet
COPY --from=Builder /go/bin/jb /usr/local/bin/jb

ENTRYPOINT ["/bin/bash"]

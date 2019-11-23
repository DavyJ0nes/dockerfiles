FROM sparkprime/jsonnet AS source

FROM alpine:3.10

LABEL MAINTAINER=davyj0nes

COPY --from=source /usr/local/bin/jsonnet usr/local/bin/jsonnet
RUN apk --no-cache add bash git jq libstdc++

ENTRYPOINT ["/bin/bash"]

FROM alpine:3.6

RUN apk update && \
    apk add ca-certificates && \
    apk add wget && \
    apk add git && \
    apk add python3-dev && \
    apk add jq && \
    apk add zsh

# awscli
RUN pip3 install awscli

# terraform
# packer

# ohmyzsh
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"; exit 0
ADD .zshrc /root/.zshrc

WORKDIR "/srv/app"

ENTRYPOINT ["zsh"]

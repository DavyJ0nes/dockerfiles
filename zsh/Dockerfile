FROM alpine:3.6

RUN apk update && \
    apk add ca-certificates && \
    apk add wget && \
    apk add git && \
    apk add zsh

# ohmyzsh
RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"; exit 0
ADD .zshrc /root/.zshrc

WORKDIR "/srv/app"

ENTRYPOINT ["zsh"]

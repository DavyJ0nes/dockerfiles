FROM ubuntu

RUN apt-get update && apt-get install -y x11vnc xvfb doom-wad-shareware libglu1

COPY * /root/

WORKDIR /root

RUN mkdir ~/.vnc && echo "exec /root/doomlegacy" >> /root/.bashrc

# Setup a password
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

EXPOSE 5900
CMD    ["x11vnc", "-forever", "-usepw", "-create"]

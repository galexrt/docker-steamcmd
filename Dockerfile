FROM debian:jessie
MAINTAINER Alexander Trost <galexrt@googlemail.com>

RUN groupadd -r steam && useradd -r -g steam steam

ENV STEAMCMD_PATH="/steamcmd" DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get install -y curl lib32gcc1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /steamcmd && \
    chown steam:steam -R /steamcmd
USER steam
RUN cd /steamcmd && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -xz

WORKDIR "/steamcmd"
ENTRYPOINT ["/steamcmd/steamcmd.sh"]

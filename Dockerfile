FROM debian:jessie
MAINTAINER Alexander Trost <galexrt@googlemail.com>
ENV STEAMCMD_PATH="/steamcmd" STEAMCMD_USER="steamcmd" STEAMCMD_GROUP="steamcmd"
RUN groupadd -r "$SERVER_GROUP" && \
    useradd -r -m -d "$STEAMCMD_PATH" -g "$STEAMCMD_USER" "$STEAMCMD_GROUP" && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        ca-certificates \
        lib32gcc1 \
        net-tools \
        lib32stdc++6 \
        lib32z1 \
        lib32z1-dev \
        curl && \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/* \
        /var/cache/debconf/*-old \
        /var/lib/apt/lists/* \
        /usr/share/doc/* && \
    mkdir -p "$STEAMCMD_PATH" && \
    chown "$STEAMCMD_USER":"$STEAMCMD_GROUP" "$STEAMCMD_PATH"
USER "$STEAMCMD_USER"
RUN curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | \
    tar -xz -C "$STEAMCMD_PATH" && \
    "$STEAMCMD_PATH/steamcmd.sh" +login anonymous +quit
WORKDIR "$STEAMCMD_PATH"
ENTRYPOINT ["./steamcmd.sh"]

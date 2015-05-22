FROM debian:jessie
MAINTAINER Alexander Trost <galexrt@googlemail.com>
ENV STEAMCMD_PATH="/opt/steamcmd" STEAMCMD_USER="steam" STEAMCMD_GROUP="steam" DEBIAN_FRONTEND="noninteractive"
RUN groupadd -r "$STEAMCMD_GROUP" && \
    useradd -r -m -d "$STEAMCMD_PATH" -g "$STEAMCMD_GROUP" "$STEAMCMD_USER" && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        ca-certificates \
        lib32gcc1 \
        net-tools \
        lib32stdc++6 \
        lib32z1 \
        lib32z1-dev \
        curl && \
    apt-get clean && \
    rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/locale/* \
        /var/cache/debconf/*-old \
        /var/lib/apt/lists/* \
        /usr/share/doc/*
USER "$STEAMCMD_USER"
RUN curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | \
    tar -xz -C "$STEAMCMD_PATH" && \
    "$STEAMCMD_PATH/steamcmd.sh" +login anonymous +quit
WORKDIR "$STEAMCMD_PATH"
ENTRYPOINT ["./steamcmd.sh"]

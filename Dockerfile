FROM debian:jessie
MAINTAINER Alexander Trost <galexrt@googlemail.com>
# Add seperate Steam user
RUN groupadd -r steam && useradd -r -g steam steam
# Set an STEAMCMD_PATH env for other images that use this image by using FROM
ENV STEAMCMD_PATH="/steamcmd" DEBIAN_FRONTEND="noninteractive"
# Install some base libraries
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        ca-certificates \
        lib32gcc1 \
        net-tools \
        lib32stdc++6 \
        lib32z1 \
        lib32z1-dev \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p "$STEAMCMD_PATH" && \
    chown steam:steam -R "$STEAMCMD_PATH" && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | \
    tar -xz -C "$STEAMCMD_PATH"
# Switch to Steam user
USER steam
WORKDIR "$STEAMCMD_PATH"
ENTRYPOINT ["$STEAMCMD_PATH/steamcmd.sh"]

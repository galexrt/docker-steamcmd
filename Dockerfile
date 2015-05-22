FROM galexrt/gameserverbase:latest
MAINTAINER Alexander Trost <galexrt@googlemail.com>
ENV STEAMCMD_PATH="/steamcmd"
USER "$SERVER_USER"
RUN curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | \
    tar -xz -C "$STEAMCMD_PATH" && \
    "$STEAMCMD_PATH/steamcmd.sh" +login anonymous +quit
WORKDIR "$STEAMCMD_PATH"
ENTRYPOINT ["./steamcmd.sh"]

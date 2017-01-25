# docker-steamcmd

[![](https://images.microbadger.com/badges/image/galexrt/steamcmd.svg)](https://microbadger.com/images/galexrt/steamcmd "Get your own image badge on microbadger.com")

[![Docker Repository on Quay](https://quay.io/repository/galexrt/steamcmd/status "Docker Repository on Quay")](https://quay.io/repository/galexrt/steamcmd)

Image available from:
* [**Quay.io**](https://quay.io/repository/galexrt/steamcmd)
* [**Docker Hub**](https://hub.docker.com/r/galexrt/steamcmd)

Image based on galexrt/gameserverbase:latest.

The SteamCMD path is saved in the env var `$STEAMCMD_PATH`.
The direct location of `steamcmd.sh` script is in `$STEAMCMD`.

## Usage
### Using the SteamCMD
```
docker run \
    -it \
    --name=steamcmd \
    quay.io/galexrt/steamcmd:latest
    STEAMCMD_ARGUMENTS_HERE
```

#### Example: Installing CSGO dedicated server
```
docker run \
    -it \
    --name=steamcmd \
    -v /opt/docker/csgo-gameserver:/data
    quay.io/galexrt/steamcmd:latest
    +login anonymous +force_install_dir /data +app_update 740 +quit
```

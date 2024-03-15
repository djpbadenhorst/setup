docker run -d \
    --name minidlna \
    --net host \
    -e PUID=1000 \
    -e PGID=1000 \
    -e MINIDLNA_DIR_V_1=/files/ \
    -e MINIDLNA_ROOT_CONTAINER=V \
    -e MINIDLNA_ENABLE_INOTIFY=YES \
    -e MINIDLNA_FRIENDLY_NAME=minidlna \
    -e MINIDLNA_FORCE_SORT_CRITERIA=+upnp:class,-dc:date,+upnp:album,+upnp:originalTrackNumber,+dc:title \
    --mount type=bind,src=/home/djpb/.docker/data/qbittorrent/private,dst=/files/ \
    --restart=always \
    giof71/minidlna

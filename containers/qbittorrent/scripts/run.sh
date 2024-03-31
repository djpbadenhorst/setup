mkdir -p ~/Workspace/storage/torrents
mkdir -p /home/djpb/.docker/data/qbittorrent-private/private
mkdir -p /home/djpb/.docker/data/qbittorrent-private/partial
mkdir -p /home/djpb/.docker/data/qbittorrent/partial
docker run -d \
       --name qbittorrent-private \
       --net=host \
       -e PUID=1000 \
       -e PGID=1000 \
       -e TZ="ZA" \
       -e WEBUI_PORTS="9001/tcp,9001/udp" \
       -v ~/.docker/data/qbittorrent-private/config:/config \
       --mount type=bind,src=/home/djpb/.docker/data/qbittorrent-private/private,dst=/downloads/private/ \
       --mount type=bind,src=/home/djpb/.docker/data/qbittorrent-private/partial,dst=/downloads/partial/ \
       --restart=always \
       ghcr.io/hotio/qbittorrent
docker run -d \
       --name qbittorrent \
       --net=host \
       -e PUID=1000 \
       -e PGID=1000 \
       -e TZ="ZA" \
       -e WEBUI_PORTS="9000/tcp,9000/udp" \
       -v ~/.docker/data/qbittorrent/config:/config \
       --mount type=bind,src=/home/djpb/Workspace/storage/torrents/,dst=/downloads/torrents/ \
       --mount type=bind,src=/home/djpb/.docker/data/qbittorrent/partial,dst=/downloads/partial/ \
       --restart=always \
       ghcr.io/hotio/qbittorrent

#/app/vuetorrent

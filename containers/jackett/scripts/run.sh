docker run -d \
       --name=jackett \
       --net=host \
       -e PUID=1000 \
       -e PGID=1000 \
       -e TZ=ZA \
       -e AUTO_UPDATE=true \
       -v /home/djpb/.docker/data/jackett/config:/config \
       -v /home/djpb/.docker/data/jackett/torrents:/downloads \
       --restart=always \
       lscr.io/linuxserver/jackett:latest

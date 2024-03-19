echo "Enter Password:"
read VNC_PASSWORD
mkdir -p /home/djpb/Workspace/storage
docker run -d \
       --privileged \
       --shm-size 1g \
       -p 10000:10000 \
       -e VNC_PASSWD=$VNC_PASSWORD \
       -e PORT=10000 \
       -e VNC_PORT=5900 \
       -e AUDIO_PORT=1699 \
       -e WEBSOCKIFY_PORT=6900 \
       -e SCREEN_WIDTH=1024 \
       -e SCREEN_HEIGHT=768 \
       -e SCREEN_DEPTH=24 \
       -v /home/djpb/.docker/data/kodi/config:/home/ubuntu/.kodi/ \
       --mount type=bind,src=/home/djpb/Workspace/storage/,dst=/home/ubuntu/storage/ \
       --restart=always \
       --name=kodi kodi

docker cp ./docker/NFAuthentication.key kodi:/home/ubuntu
docker exec -it kodi sudo apt install kodi-inputstream-adaptive
#PIN: 2580

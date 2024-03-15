echo "Enter Password:"
read VNC_PASSWORD
mkdir -p /home/djpb/.docker/data/kodi/config
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
       --name=kodi thuonghai2711/ubuntu-novnc-pulseaudio:22.04

docker exec -it kodi sudo apt update
docker exec -it kodi sudo apt install -y kodi
cat << EOF | tee -a kodi.desktop > /dev/null
[Desktop Entry]
Type=Application
Name=Kodi
Exec=/usr/bin/kodi
EOF
docker exec -it kodi mkdir /home/ubuntu/.config/autostart/
docker cp kodi.desktop kodi:/home/ubuntu/.config/autostart/
rm kodi.desktop
docker restart kodi

##############3
docker build -t kodi .

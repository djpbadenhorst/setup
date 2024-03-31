mkdir -p /home/djpb/Workspace/storage
docker run -d   \
       --privileged \
       --name=kodi \
       -p 3000:3000 \
       -v /dev/input:/dev/input \
       -v /run/udev/data:/run/udev/data \
       -v /home/djpb/.docker/data/kodi:/config/.kodi/ \
       --mount type=bind,src=/home/djpb/Workspace/storage/,dst=/config/storage/ \
       --device /dev/dri:/dev/dri \
       --restart=always \
       kodi

echo "docker exec -it kodi bash"
echo ""
echo "sudo chown abc:abc /config/.kodi/"
echo "nano /config/.config/openbox/autostart"
echo "> kodi"
echo ""
echo "nano /kclient/index.js"
echo "> chunk.length < 40000"

docker cp ./docker/NFAuthentication.key kodi:/config/
#PIN: 3445

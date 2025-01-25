mkdir -p /home/djpb/Workspace/storage
docker run -d   \
       --privileged \
       --name=kodi \
       --network=host \
       --memory=4g \
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
echo "docker restart kodi"

echo "Plugins can be installed from:"
echo " - https://castagnait.github.io/repository.castagnait/"
echo " - https://glk1001.github.io"

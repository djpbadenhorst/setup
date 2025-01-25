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

echo "Config stored in:"
echo "data/jackett/config/Jackett/"

mkdir -p /home/djpb/.docker/data/jackett/config/Jackett/
cat <<EOF > /home/djpb/.docker/data/jackett/config/Jackett/ServerConfig.json
{
  "Port": 9117,
  "LocalBindAddress": "127.0.0.1",
  "AllowExternal": true,
  "AllowCORS": true,
  "APIKey": "n7m1qs57du9egz76kek85a8se6ab7t8v",
  "AdminPassword": "20bbcd4f3371433e08c1a8c1025a1c9fdd287863b394eeb8a83c7a11b394148ac23f6dc9d74e6364d6e6d0864c40cd48b43190f21f38f04787895e58da31a00b",
  "InstanceId": "20tuyams083y0znnyxxt92c2b8djnapcup9z90cyr3qikosqgqtg5yk33tnucmbn",
  "BlackholeDir": "",
  "UpdateDisabled": false,
  "UpdatePrerelease": false,
  "BasePathOverride": "",
  "BaseUrlOverride": "",
  "CacheEnabled": true,
  "CacheTtl": 2100,
  "CacheMaxResultsPerIndexer": 1000,
  "FlareSolverrUrl": "",
  "FlareSolverrMaxTimeout": 55000,
  "OmdbApiKey": "",
  "OmdbApiUrl": "",
  "ProxyType": -1,
  "ProxyUrl": "",
  "ProxyPort": null,
  "ProxyUsername": "",
  "ProxyPassword": "",
  "ProxyIsAnonymous": true
}
EOF

docker run -d \
       -p 80:80 \
       --network=host \
       --device /dev/ttyAMA0:/dev/ttyAMA0 \
       -v ~/octoprint:/octoprint \
       --restart=always \
       --name octoprint octoprint/octoprint

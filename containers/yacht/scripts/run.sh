docker run -d -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v ~/.docker/data/yacht:/config -e DISABLE_AUTH=true --name yacht --restart=always selfhostedpro/yacht:v0.0.7-alpha-2021-05-07--12


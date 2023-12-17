docker run -dit \
       --network=docker \
       -p 5432:5432 \
       -e POSTGRES_USER=user \
       -e POSTGRES_PASSWORD=password \
       -v ~/.containers/postgres:/var/lib/postgresql/data \
       --restart always \
       --name=postgres postgres:16.1

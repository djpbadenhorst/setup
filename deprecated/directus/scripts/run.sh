docker run -dit \
       --network=docker \
       -p 8055:8055 \
       -e KEY=key \
       -e SECRET=secret \
       -e DB_CLIENT=pg \
       -e DB_HOST=postgres \
       -e DB_PORT=5432 \
       -e DB_DATABASE=directus \
       -e DB_USER=user \
       -e DB_PASSWORD=password \
       -e ADMIN_EMAIL=user@example.com \
       -e ADMIN_PASSWORD=password \
       --restart always \
       --name=directus directus/directus:10.8.2

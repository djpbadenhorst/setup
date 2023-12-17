docker run -it --rm \
       --network=docker \
       postgres:16.1 \
       psql -h postgres -U user

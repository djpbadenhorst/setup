mkdir -p ~/Workspace/storage/shared
docker run -d \
       --network=host \
       --privileged=true \
       -e "MODEL=TimeCapsule" \
       -e "AVAHI_NAME=shared" \
       -e "SAMBA_CONF_LOG_LEVEL=3" \
       -e "ACCOUNT_djpb=djpb" \
       -e "UID_djpb=1000" \
       -e "SAMBA_VOLUME_CONFIG_djpb=[djpb]; path=/shares/homes/%U; valid users = djpb; guest ok = no; read only = no; browseable = yes" \
       -v /etc/avahi/services/:/external/avahi \
       -v ~/Workspace/storage/shared:/shares/homes \
       --restart=always \
       --name=samba ghcr.io/servercontainers/samba

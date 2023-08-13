sudo apt install -y vino
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino vnc-password "$(echo -n "$VINO_PASSWORD" | base64)"

mkdir /home/djpb/.config/autostart
cat << EOF | tee -a /home/djpb/.config/autostart/vino.desktop > /dev/null
[Desktop Entry]
Type=Application
Name=Vino
Exec=/usr/bin/bash -c "sleep 5 && /usr/lib/vino/vino-server"
EOF

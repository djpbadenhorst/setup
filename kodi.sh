sudo apt install kodi

mkdir /home/djpb/.config/autostart
cat << EOF | sudo tee -a /home/djpb/.config/autostart/kodi.desktop > /dev/null
[Desktop Entry]
Type=Application
Name=Kodi
Exec=/usr/bin/kodi
OnlyShownIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false
EOF

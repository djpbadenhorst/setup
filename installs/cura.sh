wget https://github.com/Ultimaker/Cura/releases/download/5.8.1/UltiMaker-Cura-5.8.1-linux-X64.AppImage
sudo mv UltiMaker-Cura-5.8.1-linux-X64.AppImage /usr/bin/cura
sudo chmod +x /usr/bin/cura

echo "" >  /usr/share/applications/cura.desktop
cat << EOF >  /usr/share/applications/cura.desktop
[Desktop Entry]
Name=Cura
Exec=cura
Terminal=false
Type=Application
StartupNotify=true
Icon=cura
EOF

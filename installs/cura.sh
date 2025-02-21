wget https://github.com/Ultimaker/Cura/releases/download/5.9.0/UltiMaker-Cura-5.9.0-linux-X64.AppImage
sudo mv UltiMaker-Cura-5.9.0-linux-X64.AppImage /usr/bin/cura
sudo chmod +x /usr/bin/cura

wget https://upload.wikimedia.org/wikipedia/commons/9/9a/Ultimaker_cura.png
sudo mv Ultimaker_cura.png /usr/share/icons/cura.png

echo "" >  cura.desktop
cat << EOF >  cura.desktop
[Desktop Entry]
Name=Cura
Exec=cura
Terminal=false
Type=Application
StartupNotify=true
Icon=/usr/share/icons/cura.png
EOF

sudo mv cura.desktop /usr/share/applications/cura.desktop 

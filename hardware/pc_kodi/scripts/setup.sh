cat << EOF | tee /home/djpb/.config/autostart/tightvnc.desktop > /dev/null
[Desktop Entry]
Type=Application
Name=TightVNC
Exec=/usr/bin/Xtigervnc -desktop "Media Server" -localhost -rfbport 5900 -SecurityTypes None -AlwaysShared -AcceptKeyEvents -AcceptPointerEvents -AcceptSetDesktopSize -SendCutText -AcceptCutText :1
EOF

cat << EOF | tee /home/djpb/.config/autostart/easyvnc.desktop > /dev/null
[Desktop Entry]
Type=Application
Name=EasyVnc
Exec=/usr/bin/easy-novnc --addr :8000 --host localhost --port 5900 --no-url-password --novnc-params "resize=remote"
EOF

cat << EOF | tee /home/djpb/.config/autostart/kodi.desktop > /dev/null
[Desktop Entry]
Type=Application
Name=Kodi
Exec=env DISPLAY=:1 /usr/bin/kodi --standalone --windowing=x11
EOF

mkdir ~/.kodi/data
cp ./NFAuthentication.key ~/kodi/data #PIN: 2580
# Add Source https://castagnait.github.io/repository.castagnait/

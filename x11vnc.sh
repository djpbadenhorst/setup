sudo apt install -y x11vnc

cat << EOF | sudo tee -a /etc/systemd/system/x11vnc.service > /dev/null
[Unit]
After=multi-user.target
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/djpb/.vnc/passwd -rfbport 5900 -shared
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable x11vnc.service
sudo systemctl daemon-reload

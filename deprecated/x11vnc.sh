sudo apt install -y x11vnc

cat << EOF | sudo tee -a /etc/systemd/system/x11vnc.service > /dev/null
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target
[Service]
Type=simple
User=djpb
ExecStart=/usr/bin/x11vnc -auth /var/run/sddm/* -noxdamage -forever -loop -repeat -shared
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable x11vnc.service
sudo systemctl daemon-reload

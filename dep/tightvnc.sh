sudo apt install -y tightvncserver
mkdir -p /home/djpb/.vnc/

echo <PASSWORD> | vncpasswd -f > /home/djpb/.vnc/passwd
sudo chown -R djpb:djpb /home/djpb/.vnc
sudo chmod 0600 /home/djpb/.vnc/passwd

cat << EOF | tee -a /home/djpb/.vnc/xstartup > /dev/null
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
exec dbus-launch startxfce4
EOF

chmod +x /home/djpb/.vnc/xstartup

cat << EOF | sudo tee -a /etc/systemd/system/vncserver.service > /dev/null
[Unit]
After=syslog.target network.target
[Service]
Type=forking
User=djpb
PAMName=login
PIDFile=/home/djpb/.vnc/%H:1.pid
ExecStartPre=-/usr/bin/vncserver -kill :1 > /dev/null 2>&1
ExecStart=/usr/bin/vncserver
ExecStop=/usr/bin/vncserver -kill :1
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable vncserver.service
sudo systemctl daemon-reload

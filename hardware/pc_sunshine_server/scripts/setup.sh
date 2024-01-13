echo 'KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"' | \
sudo tee /etc/udev/rules.d/85-sunshine.rules

cat > sunshine.service << EOL
[Unit]
Description=Sunshine self-hosted game stream host for Moonlight.
StartLimitIntervalSec=500
StartLimitBurst=5

[Service]
ExecStart=<see table>
Restart=on-failure
RestartSec=5s

[Install]
WantedBy=default.target
EOL
sudo mv ./sunshine.service ~/.config/systemd/user/sunshine.service
systemctl --user enable sunshine

sudo setcap cap_sys_admin+p $(readlink -f $(which sunshine))


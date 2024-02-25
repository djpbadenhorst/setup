sudo apt install -y wakeonlan
echo "wakeonlan A8:A1:59:93:22:7D" > wake_desktop
chmod +x wake_desktop
sudo mv ./wake_desktop /bin/

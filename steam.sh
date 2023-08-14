wget https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
sudo dpkg -i steam.deb
rm steam.deb
sudo apt --fix-broken install -y

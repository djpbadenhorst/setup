sudo apt install -y cockpit cockpit-pcp

wget https://github.com/45Drives/cockpit-navigator/releases/download/v0.5.10/cockpit-navigator_0.5.10-1focal_all.deb
sudo apt install -y ./cockpit-navigator_0.5.10-1focal_all.deb
rm cockpit-navigator_0.5.10-1focal_all.deb

wget https://github.com/mrevjd/cockpit-docker/releases/download/v2.0.3/cockpit-docker.tar.gz
sudo tar xf cockpit-docker.tar.gz -C /usr/share/cockpit
rm cockpit-docker.tar.gz

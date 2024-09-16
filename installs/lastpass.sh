sudo apt install -y build-essential cmake libxml2-dev libssl-dev libcurl4-openssl-dev pkg-config
git clone https://github.com/lastpass/lastpass-cli.git
cd lastpass-cli
make
sudo mv build/lpass /usr/bin/
cd ../
sudo rm -rf lastpass-cli

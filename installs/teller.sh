git clone https://github.com/tellerops/teller
cd teller
git checkout tags/v1.5.6
make build
sudo mv teller /usr/bin/
cd ../
rm -rf teller

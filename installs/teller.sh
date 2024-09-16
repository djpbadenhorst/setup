wget https://github.com/tellerops/teller/releases/download/v2.0.7/teller-x86_64-linux.tar.xz
tar -xvf teller-x86_64-linux.tar.xz
sudo mv teller-x86_64-linux/teller /usr/bin/

curl -LO "http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb"
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb

rm libssl1.1_1.1.1f-1ubuntu2.23_amd64.deb
rm teller-x86_64-linux.tar.xz
rm -rf teller-x86_64-linux/

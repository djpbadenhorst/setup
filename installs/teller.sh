#wget https://github.com/tellerops/teller/releases/download/v1.5.6/teller_1.5.6_Linux_x86_64.tar.gz
#tar -xvf teller_1.5.6_Linux_x86_64.tar.gz
#rm LICENSE.txt
#rm README.md
#rm teller_1.5.6_Linux_x86_64.tar.gz
#sudo mv teller /usr/bin/

git clone https://github.com/tellerops/teller
cd teller
make build
sudo mv teller /usr/bin
cd ../
rm -rf teller

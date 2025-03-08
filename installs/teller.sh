#git clone https://github.com/tellerops/teller
#cd teller
#git checkout tags/v1.5.6
#make build
#sudo mv teller /usr/bin/
#cd ../
#rm -rf teller

wget https://github.com/tellerops/teller/releases/download/v1.5.6/teller_1.5.6_Linux_x86_64.tar.gz
tar -xvf ./teller_1.5.6_Linux_x86_64.tar.gz
rm ./README.md
rm ./LICENSE.txt
rm teller_1.5.6_Linux_x86_64.tar.gz

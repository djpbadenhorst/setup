wget https://releases.hashicorp.com/vagrant/2.4.3/vagrant_2.4.3_linux_amd64.zip
unzip vagrant_2.4.3_linux_amd64.zip
rm vagrant_2.4.3_linux_amd64.zip
rm LICENSE.txt
sudo mv vagrant /usr/bin/

sudo apt install virtualbox
vagrant box add ubuntu/jammy64
vagrant box add archman/linuxmint

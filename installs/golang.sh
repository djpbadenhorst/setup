sudo apt-get install bison
curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer | bash
source /home/djpb/.gvm/scripts/gvm

gvm install go1.4 -B
gvm use go1.4

gvm install go1.17.13
gvm use go1.17.13

gvm install go1.20.7
gvm use go1.20.7

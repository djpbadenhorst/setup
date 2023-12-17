# README
firefox
golang
imagemagick
unverified
vagrant

#ANDROID
sudo snap install androidsdk
androidsdk "platform-tools" "platforms;android-29"
androidsdk "build-tools;29.0.3"
androidsdk --licenses
androidsdk --update
export ANDROID_HOME=~/AndroidSDK/

# FLUTTER
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.3.1-stable.tar.xz
tar xf ~/Downloads/flutter_linux_3.3.1-stable.tar.xz
export PATH="$PATH:`pwd`/flutter/bin"
flutter doctor

# NODE
#curl -sL https://deb.nodesource.com/setup_17.x | sudo bash
sudo apt install -y nodejs
# NODE - ALTERNATIVE
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install v17.9.0

#PYTHON
BOOTSTRAP_DIR=$(realpath $BASH_SOURCE)
sudo apt install -y python3 python3-dev python3-distutils
sudo apt install -y virtualenv
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt install -y python3.8 python3.8-dev python3.8-distutils python3.8-tk
cat << EOF > $WSPACE/scripts/venv
if [ ! -d "./venv" ] 
then
    virtualenv -p python3.8 venv
fi
source ./venv/bin/activate
EOF
chmod +x $WSPACE/scripts/venv

#PYTHON ALT
sudo apt install -y python3 python3-dev python3-distutils
sudo apt install -y virtualenv


#STORAGE
BOOTSTRAP_DIR=$(realpath $BASH_SOURCE)

mkdir $WSPACE/storage

wget https://github.com/kahing/goofys/releases/latest/download/goofys 
chmod +x ./goofys
mv ./goofys $WSPACE/scripts/

cat << EOF > $WSPACE/scripts/mntstorage
eval "$(lpass show --notes /pers/env/storage)"
goofys --endpoint https://s3.eu-central-1.wasabisys.com djpb-storage $WSPACE/storage/
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
EOF
chmod +x $WSPACE/scripts/mntstorage

#UTILS
sudo apt install -y curl
sudo apt install -y jq

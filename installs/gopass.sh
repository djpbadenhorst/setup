sudo apt install -y gnupg rng-tools
export ARCH=$(arch)
if [ ARCH == "x86_64" ]
then
    wget https://github.com/gopasspw/gopass/releases/download/v1.15.11/gopass_1.15.11_linux_amd64.deb
    sudo dpkg -i gopass_1.15.11_linux_amd64.deb
    rm gopass_1.15.11_linux_amd64.deb 
elif [ ARCH == "aarch64" ] 
then
    wget https://github.com/gopasspw/gopass/releases/download/v1.15.11/gopass_1.15.11_linux_arm64.deb
    sudo dpkg -i gopass_1.15.11_linux_arm64.deb
    rm gopass_1.15.11_linux_arm64.deb 
fi
	   



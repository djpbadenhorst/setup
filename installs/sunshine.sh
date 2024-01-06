wget https://github.com/LizardByte/Sunshine/releases/download/v0.21.0/sunshine-debian-bookworm-arm64.deb
wget https://github.com/LizardByte/Sunshine/releases/download/v0.21.0/sunshine-debian-bullseye-arm64.deb
wget https://github.com/LizardByte/Sunshine/releases/download/v0.21.0/sunshine.AppImage
echo "chmod +x sunshine.AppImage"
echo "mv ./sunshine.AppImage /usr/bin/sunshine"
echo "sunshine --install"
echo "Figure out launch on startup"

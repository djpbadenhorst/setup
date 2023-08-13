cd ~
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-400.0.0-linux-x86_64.tar.gz
tar -xf google-cloud-cli-400.0.0-linux-x86_64.tar.gz
rm google-cloud-cli-400.0.0-linux-x86_64.tar.gz
bash ./google-cloud-sdk/install.sh -q --path-update

echo "Run 'source ~/bash.rc && gcloud init'"

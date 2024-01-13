git remote remove origin
git remote add origin git@github.com:djpbadenhorst/setup.git
unzip ./d4decrypt.zip
read -r -p 'Please enter password: ' PASSWORD
export SSH_KEY=$(./d4decrypt -d -i ./secrets/github.encrypted -p $PASSWORD)
eval $(ssh-agent)
ssh-add - <<< $(echo -e $SSH_KEY)
#if arch==aarch64

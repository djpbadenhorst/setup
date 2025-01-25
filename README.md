# README
This readme describes required setup for a variety of programs on a variety of architectures.

## LPASS
Install lpass:
```
bash ./installs/lastpass.sh
echo "" >> ~/.bashrc
echo "export LPASS_DISABLE_PINENTRY=1" >> ~/.bashrc
source ~/.bashrc
eval $(ssh-agent)
ssh-add - <<< $(lpass show --notes pers/github_ssh_key)
```

## GOPASS
Setting up gopass will give access to a variety of secrets:
```
bash ./installs/gopass.sh
lpass show --notes pers/gopass_gpg_key | gpg --import
lpass show --notes pers/gopass_gpg_secret | gpg --import

gopass init djpbadenhorst
git clone git@github.com:djpbadenhorst/secrets.git ~/.local/share/gopass/stores/root/pers
gopass mounts add pers ~/.local/share/gopass/stores/root/pers/
```

## GIT ORIGIN
To use git with ssl auth, run the following:
```
git remote remove origin
git remote add origin git@github.com:djpbadenhorst/setup.git
```

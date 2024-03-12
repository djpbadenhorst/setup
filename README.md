# README
This readme describes required setup for a variety of programs on a variety of architectures.

## TO CLONE THE REPO
To clone the repo, run the following:

```
ssh-add - <<< $(lpass show --notes pers/github_ssh_key)
git clone git@github.com:djpbadenhorst/setup.git
```

## GOPASS
Setting up gopass will give access to a variety of secrets:

```
sudo apt install -y gnupg rng-tools
wget https://github.com/gopasspw/gopass/releases/download/v1.15.11/gopass_1.15.11_linux_amd64.deb
sudo dpkg -i gopass_1.15.11_linux_amd64.deb

ssh-add - <<< $(lpass show --notes pers/github_ssh_key)
lpass show --notes pers/gopass_gpg_key | gpg --import
lpass show --notes pers/gopass_gpg_secret | gpg --import

gopass init djpbadenhorst
gopass clone git@github.com:djpbadenhorst/secrets.git pers djpbadenhorst
```
x

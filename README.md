# README
This readme describes required setup for a variety of programs on a variety of architectures.

## LPASS
Install lpass as follows:
```
bash ./installs/lastpass.sh
export LPASS_DISABLE_PINENTRY=1
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
gopass clone git@github.com:djpbadenhorst/secrets.git pers djpbadenhorst
```

## GIT ORIGIN
To use git with ssl auth, run the following:
```
git remote remove origin
git remote add origin git@github.com:djpbadenhorst/setup.git
```

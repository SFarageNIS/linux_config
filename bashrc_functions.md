# Bash shell customizations
Some of these are random, but my favorite is the 'update_all' function.

## Import other files that contain customizations
```
# import all the good stuff
for file in ~/.bashrc.d/*; do
  if [ -f ${file} ]
      echo "Loading: " $( basename ${file} );then
      . ${file}
  fi
done
```

## Update all function
```
# all-in-one-update-all
function update_all {
        sudo apt update -y && sudo apt upgrade -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y
}
```
Dell specific update (and awscli)
```
#update all function
function update_all {
  sudo apt update -y && sudo apt upgrade -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y && pip3 install awscli --upgrade --user && fwupdmgr get-updates
}
```

## Untar
```
# un tar tar.gz
alias untar="tar -xzvf"
```

## Easy directory traversal
```
# directory navigation
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."
alias cd......="cd ../../../../.."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
```

## Better copying
```
# better copying
alias cp="rsync -avz --progress --stats"
```

## Make backup file
```
function backup_file {
  if test -f "$1"; then
    sudo cp -vi "$1"{,.bak-$(date +%Y.%m.%d-%H.%M.%S)}
  else
    echo "$1 doesn't exist or isn't a file"
  fi
}

# alternatively
# [[ -f "$1" ]] && cp -v "$1"{,.bak} || echo "$1 doesn't exist or isn't a file"
```


## List alias (these are built-in to new Ubuntu)
```
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
```

## Create parent directories if path includes them
```
# create parent directories
alias mkdir='mkdir -pv'
```

## Safety net action
Not sure if I want this, but it looks helpful
```
# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
# confirmation #
alias mv='mv -i'
# don't want to double-alias cp if you're using the rsync alias above
# alias cp='cp -i'
alias ln='ln -i'
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
```

## Resume wget by default
```
# Resume by default - this one saved by butt so many times ##
alias wget='wget -c'
```

## Easy-type password generation and randomness
moved to [newpassword script](https://github.com/SFarageNIS/linux_config/blob/master/scripts.md#new-password-generation)

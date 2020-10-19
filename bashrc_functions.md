# Bash shell customizations
Some of these are random, but my favorite is the 'update_all' function.

## Update all function
```
# all-in-one-update-all
function update_all {
        sudo apt update -y && sudo apt upgrade -y && sudo apt-get dist-upgrade -y && sudo apt autoremove -y
}
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

## List alias
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
alias cp='cp -i'
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

## Easy-type password generation
```
new_password ()
{
 echo "$(pwgen -s -1 6 -A0)$(pwgen -s -1 6 -c0 -r abcdefghijklmnopqrstuvwxyz)$(pwgen -s -1 8 -nA -r abcdefghijklmnopqrstuvwxyz)$(pwgen -s -1 6 -A0)$(pwgen -s -1 8 -nA -r abcdefghijklmnopqrstuvwxyz)$(pwgen -s -1 1 -y)$(pwgen -s -1 2 -nA -r abcdefghijklmnopqrstuvwxyz)"
}
```

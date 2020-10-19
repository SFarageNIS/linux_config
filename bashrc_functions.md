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

## Easy-type password generation and randomness
```
new_password ()
{
 if [ -z "$1" ]; then times=1; else times=$1; fi
 for (( c=1; c<=times; c++ ))
 echo "$(rand_upper 6)$(rand_lower 6)$(rand_numeric 8)$(rand_upper 6)$(rand_numeric 8)$(rand_symbols 1)$(rand_numeric 2)"
 done
}

function rand_upper ()
{
  length=$1
  pwgen -s -1 $length -c0 -r abcdefghijklmnopqrstuvwxyz #upper
}

function rand_lower ()
{
  length=$1
  pwgen -s -1 $length -A0 # Lower case random generation
}

function rand_numeric ()
{
  length=$1
  pwgen -s -1 $length -nA -r abcdefghijklmnopqrstuvwxyz #numeric
}

function rand_symbols ()
{
  length=$1
  pwgen -s -1 $length -A0y -r abcdefghijklmnopqrstuvwxyz #symbols
}

```

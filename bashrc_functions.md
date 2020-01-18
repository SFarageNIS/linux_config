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

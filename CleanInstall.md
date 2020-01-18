# Clean install first steps
Here are some of the tips I follow when making a new install.

## Basics
- [ ]  Install/configure SSH
- [ ]  Install Git

## Hardening
- [ ]  [https://linux-audit.com/ubuntu-server-hardening-guide-quick-and-secure/](https://linux-audit.com/ubuntu-server-hardening-guide-quick-and-secure/)
- [ ]  Create new user, add to su group
    - `adduser` then `chpasswd -c SHA512 -s 1000000`, Ctrl+D to break, verify with `cat /etc/shadow`
- [ ]  Refresh SSH keys if using base image of anything
    - [ ]  `cd etc/ssh/`  `dpkg-reconfigure openssh-server` `passwd root`
    
## Vim settings
- [ ]  Vim settings (~/.vimrc)
- [ ]  Set VIM default editor (`sudo update-alternatives --config editor`)
- [ ]  Change color scheme globally (~/.vimrc) add `colorscheme evening`
- [ ]  Change vim config colors (one-off), open vim, type `:colorscheme evening`

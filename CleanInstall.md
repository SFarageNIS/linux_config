# Clean install first steps
Here are some of the tips I follow when making a new install.

## Basics
- [ ]  Install/configure SSH
- [ ]  Install Git

## Hardening
- [ ]  [https://linux-audit.com/ubuntu-server-hardening-guide-quick-and-secure/](https://linux-audit.com/ubuntu-server-hardening-guide-quick-and-secure/)
- [ ]  Create new user, add to su group
    - Update [default PAM settings](https://askubuntu.com/questions/894404/how-to-increase-the-number-of-hashing-rounds-for-etc-shadow)
    - `/etc/pam.d/common-password` - edit the line with pam_unix.so, add SHA512 if not present, and `rounds=1000000` if not present.
    - `adduser` If you didn't do above step, do: `chpasswd -c SHA512 -s 1000000`, Ctrl+D to break, verify with `cat /etc/shadow`
- [ ]  Refresh SSH keys if using base image of anything
    - [ ]  `cd etc/ssh/`  `dpkg-reconfigure openssh-server` `passwd root`
    
## Vim settings
- [ ]  Vim settings (~/.vimrc)
- [ ]  Set VIM default editor (`sudo update-alternatives --config editor`)
- [ ]  Change color scheme globally (~/.vimrc) add `colorscheme evening`
- [ ]  Change vim config colors (one-off), open vim, type `:colorscheme evening`

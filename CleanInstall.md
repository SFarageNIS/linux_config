# Clean install first steps
Here are some of the tips I follow when making a new install.

## Basics
- [ ]  Install/configure SSH
- [ ]  Install Git
- [ ]  Install [exa](https://the.exa.website/install/linux)
- [ ]  Remove FF snap package in favor of apt install

## Hardening
- [ ]  [https://linux-audit.com/ubuntu-server-hardening-guide-quick-and-secure/](https://linux-audit.com/ubuntu-server-hardening-guide-quick-and-secure/)
- [ ]  Create new user, add to su group
    - Update [default PAM settings](https://askubuntu.com/questions/894404/how-to-increase-the-number-of-hashing-rounds-for-etc-shadow)
    - `/etc/pam.d/common-password` - edit the line with pam_unix.so, add SHA512 if not present, and `rounds=3000000` if not present.
    - 2021-10 mine looks like this on 5900x `password        [success=1 default=ignore]      pam_unix.so obscure sha512 rounds=3500000`
    - `adduser` If you didn't do above step, do: `chpasswd -c SHA512 -s 3000000`, Ctrl+D to break, verify with `cat /etc/shadow`
- [ ]  SSH - refresh keys if using base image of anything
    - [ ]  `cd etc/ssh/`, remove all existing default keys `rm -v /etc/ssh/ssh_host_*`, regenerate new keys `dpkg-reconfigure openssh-server`, restart ssh service `systemctl restart ssh`
- [ ]  SSH - [Change default port](https://www.scalahosting.com/kb/changing-default-ssh-port-in-openssh/) and only allow keyfiles, [general hardening](https://www.digitalocean.com/community/tutorials/how-to-harden-openssh-on-ubuntu-20-04)
    
## Vim settings
- [ ]  Vim settings (~/.vimrc)
- [ ]  Set VIM default editor (`sudo update-alternatives --config editor`)
- [ ]  Change color scheme globally (~/.vimrc) add `colorscheme evening`
- [ ]  Change vim config colors (one-off), open vim, type `:colorscheme evening`

## Other
- [ ] Disable unattended upgrades `sudo dpkg-reconfigure unattended-upgrades` (pick 'no', don't auto-update)
- [ ] Add `HISTTIMEFORMAT="%F %T "` to `.bashrc` to add timestamps to bash history

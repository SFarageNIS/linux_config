# Clean install first steps
Here are some of the tips I follow when making a new install.

## Hardening
- [ ]  `https://dev-notes.eu/2020/12/LUKS-Encrypt-Hard-Drive-with-Cryptsetup-on-Ubuntu-20.04/` (dead as of 3/25 :/ served me well but I have page DL'd)
- [ ]  Enable LUKS disk encryption with keyfile on Linux
- [ ]  [https://linux-audit.com/ubuntu-server-hardening-guide-quick-and-secure/](https://linux-audit.com/ubuntu-server-hardening-guide-quick-and-secure/)
- [ ]  Create new user, add to su group
    - Update [default PAM](https://askubuntu.com/questions/894404/how-to-increase-the-number-of-hashing-rounds-for-etc-shadow) [settings](https://www.reddit.com/r/Passwords/comments/1cd58c3/psa_default_scrypt_yescrypt_and_gostyescrypt/)
    - `/etc/pam.d/common-password` - edit the line with pam_unix.so, add `yescrypt` if not present, and `rounds=11` if not present.
    - 2024-11 mine looks like this on 5900x `password        [success=2 default=ignore]      pam_unix.so obscure use_authtok try_first_pass yescrypt rounds=10`
    - timing/verify `echo password | perf stat -e 'cycles,instructions' mkpasswd -m yescrypt -s -R 11`
    - `adduser` If you didn't do above step, do: `chpasswd -c SHA512 -s 3000000`, Ctrl+D to break, verify with `cat /etc/shadow`
    - then actually change your password using `passwd`
- [ ]  SSH - refresh keys if using base image of anything
    - [ ]  `cd etc/ssh/`, remove all existing default keys `rm -v /etc/ssh/ssh_host_*`, regenerate new keys `dpkg-reconfigure openssh-server`, restart ssh service `systemctl restart ssh`
- [ ]  SSH - [Change default port](https://www.scalahosting.com/kb/changing-default-ssh-port-in-openssh/) and only allow keyfiles, [general](https://www.redhat.com/sysadmin/eight-ways-secure-ssh) [hardening](https://www.digitalocean.com/community/tutorials/how-to-harden-openssh-on-ubuntu-20-04) [guidance](https://0ut3r.space/2023/10/24/openssh-hardening/).  

## Initial config/apps
- [ ]  Install/configure SSH
- [ ]  Install Git
- [ ]  Install [exa](https://the.exa.website/install/linux)
- [ ]  Remove FF snap package in favor of apt [install](https://support.mozilla.org/en-US/kb/install-firefox-linux#w_install-firefox-deb-package-for-debian-based-distributions-recommended)

## Vim settings
- [ ]  Vim settings (~/.vimrc)
- [ ]  Set VIM default editor (`sudo update-alternatives --config editor`)
- [ ]  Change color scheme globally (~/.vimrc) add `colorscheme evening`
- [ ]  Change vim config colors (one-off), open vim, type `:colorscheme evening`

## Other
- [ ] Disable unattended upgrades `sudo dpkg-reconfigure unattended-upgrades` (pick 'no', don't auto-update)
- [ ] Add `HISTTIMEFORMAT="%F %T "` to `.bashrc` to add timestamps to bash history

Find contents of PAM files (replace SEARCH_TERM)
```
find /etc/pam.d/ -type f -not -name "*.bak*" -exec echo {} \; | while read pam_file; do echo "FILENAME: ${pam_file}"; grep -i "SEARCH_TERM" ${pam_file}; done
```

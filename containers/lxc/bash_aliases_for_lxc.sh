

alias 'lxc-ls'='lxc-ls -f'
alias 'lxc'='lxc-ls -f'

# for creating new containers.  add --newname=<NAME> when using this
alias 'lxc-new'='lxc-copy --name=base -B overlayfs -s -F -l INFO --allowrunning'

alias 'lxc-size'='du -sh $(find /var/lib/lxc/* -maxdepth 0 -type d)'

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export SHELL=$(which zsh)
[ -n "$SSH_TTY" ] && exec $SHELL

# User specific aliases and functions

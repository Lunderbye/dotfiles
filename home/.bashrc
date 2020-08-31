# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# Misc exports
export LIBVIRT_DEFAULT_URI="qemu:///system"
export HISTSIZE=-1
export HISTFILESIZE=-1
export EDITOR=/usr/bin/vim

# Source .aliases if existing
test -s ~/.aliases && . ~/.aliases || true

# Source .functions.sh if existing
[[ -f "$HOME/.functions.sh" ]] && source ~/.functions.sh

# Set GOPATH
export PATH=~/.local/bin:"$PATH"
type go >/dev/null 2>&1 && export GOPATH=$(go env GOPATH) && export PATH="$PATH":$GOPATH/bin

# Make sure we only run one ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"
fi

# Install prompt from starship.rs
eval "$(starship init bash)"

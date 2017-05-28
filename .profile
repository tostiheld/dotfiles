# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then

	eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets,pkcs11)

	eval $(ssh-agent)

	# setup gnupg
	GNUPGHOME=$HOME/.gnupg
	export GNUPGHOME
	/usr/bin/gpg-agent --daemon
	GPG_AGENT_INFO="${GNUPGHOME}/S.gpg-agent:0:1"
	export GPG_AGENT_INFO

	export QT_QPA_PLATFORMTHEME=gtk2

	#. startx > /dev/null
	exec startx -- vt1 &> /dev/null

	logout
fi


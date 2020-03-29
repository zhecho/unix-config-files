# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

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

export GOPATH="${HOME}/prj/go"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="$PATH:~/prj/powerline"
export PATH="$PATH:/usr/bin/"
export PATH="$PATH:$HOME/prj/Shotcut"
export PATH="$PATH:~/prj/Django/selenium_drivers"
export PATH="$PATH:~/prj/terraform"
export PATH="$PATH:~/prj/android-studio/bin"
export PATH="$PATH:~/prj/android-sdk/tools"
export PATH="$PATH:~/prj/android-sdk/tools/bin"
export PATH="$PATH:~/prj/android-sdk/platform-tools"
export PATH="$PATH:$HOME/prj/android-sdk/build-tools/29.0.2/"
export ANDROID_HOME="$HOME/prj/android-sdk/"

LC_ALL="en_US.UTF8"
LANG="en_US.UTF8"
export TERM="xterm-256color"
# export PS1="\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\r\n$" #export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export EDITOR=`which vi`

alias ll="ls -lart --color=never"

# kubectl from microk8s
# alias kubectl="microk8s.kubectl"

# Testing & Launching ssh-agent
function sshagent_findsockets {
    find /tmp -uid $(id -u) -type s -name agent.\* 2>/dev/null
}

function sshagent_testsocket {
    if [ ! -x "$(which ssh-add)" ] ; then
        echo "ssh-add is not available; agent testing aborted"
        return 1
    fi

    if [ X"$1" != X ] ; then
        export SSH_AUTH_SOCK=$1
    fi

    if [ X"$SSH_AUTH_SOCK" = X ] ; then
        return 2
    fi

    if [ -S $SSH_AUTH_SOCK ] ; then
        ssh-add -l > /dev/null
        if [ $? = 2 ] ; then
            echo "Socket $SSH_AUTH_SOCK is dead!  Deleting!"
            rm -f $SSH_AUTH_SOCK
            return 4
        else
            echo "Found ssh-agent $SSH_AUTH_SOCK"
            return 0
        fi
    else
        echo "$SSH_AUTH_SOCK is not a socket!"
        return 3
    fi
}

function sshagent_init {
    # ssh agent sockets can be attached to a ssh daemon process or an
    # ssh-agent process.

    AGENTFOUND=0

    # Attempt to find and use the ssh-agent in the current environment
    if sshagent_testsocket ; then AGENTFOUND=1 ; fi

    # If there is no agent in the environment, search /tmp for
    # possible agents to reuse before starting a fresh ssh-agent
    # process.
    if [ $AGENTFOUND = 0 ] ; then
       for agentsocket in $(sshagent_findsockets) ; do
            if [ $AGENTFOUND != 0 ] ; then break ; fi
            if sshagent_testsocket $agentsocket ; then AGENTFOUND=1 ; fi
        done
    fi

    # If at this point we still haven't located an agent, it's time to
    # start a new one
    if [ $AGENTFOUND = 0 ] ; then
        eval `ssh-agent`
    fi

    # Clean up
    unset AGENTFOUND
    unset agentsocket

    # Finally, show what keys are currently in the agent
    ssh-add -l
}


alias sagent="sshagent_init"

#if [ ! -S ~/.ssh/ssh_auth_sock ]; then
#  eval `ssh-agent`
#  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
#  export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
#  echo "Start and link ssh sock to $SSH_AUTH_SOCK"
#
#fi


# settitle() {
#     printf "\033k$1\033\\"
# }
# bash_prompt_command() {
#     settitle "`hostname -s`:$0"
# }
# PROMPT_COMMAND=bash_prompt_command

function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

# Gnome-terminal colors for solzrized color 

# Set correct term for tmux so solarized theme works in vim
alias tmux="TERM=screen-256color-bce tmux"

# powerline daemon
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /home/$USER/prj/powerline/powerline/bindings/bash/powerline.sh

# PS1 
function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;36m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]\n$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color $__docker_machine_ps1"
}
color_my_prompt

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
export -f show_virtual_env
PS1='$(show_virtual_env) '$PS1

# docker install docker-machine documentation
# PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '

# direnv should be last
eval "$(direnv hook bash)"


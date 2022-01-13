echo "Loading $HOME/.profile"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add PATH extras to /etc/paths or /etc/paths.d
# export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/go/bin:/usr/local/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Coloring
#export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#export TERM="xterm-color"
#PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

# Git aware PS1
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
#export PS1="\u@\h \W \[\$txtcyn\]\$git_branch\[\$txtred\]\$git_dirty\[\$txtrst\]\$ "
#export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

export PS1="\[\e[33m\]\t \[$txtgrn\]\u\[$txtwht\]@\[$txtgrn\]\h \[$txtylw\]\w\[$txtrst\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n\$ "
export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad

# Source ~/.bashrc
[ -r ~/.bashrc ] && . ~/.bashrc

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

# etc
setopt notify
unsetopt autocd beep
# bindkey -v

zstyle :compinstall filename '/home/nikolay/.zshrc'

# Autocompletion
autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Prompt
autoload -Uz vcs_info
# zstyle ':vcs_info:git:*' formats '%b '
zstyle ':vcs_info:*' enable git   
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '!'
zstyle ':vcs_info:*' unstagedstr '?'                                           
zstyle ':vcs_info:*' formats '%F{cyan}[%b]%f%F{magenta}[%f%F{green}%c%F{red}%u%f%F{magenta}]%f'

if [[ -v WINDOW ]]; then
    SCREEN_WINDOW='%F{blue}%Bscreen_'$WINDOW'%b%f '
else
    SCREEN_WINDOW=
fi

precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT=$'%F{green}%B[%*]%b%f %F{blue}%~%f ${vcs_info_msg_0_}\n${SCREEN_WINDOW}%(?..%F{red})%B>%b%f '

# Variables
typeset -U path PATH
path=(/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin /home/nikolay/.local/bin /usr/local/go/bin $path)
export PATH

# WORDCHARS to split words by '/'
# WORDCHARS=$'*?_-.[]~=/&;!#$%^(){}<>'
WORDCHARS=$'*?_-.[]~=&;!#$%^(){}<>'

# Aliases
alias mv="mv -vi"
alias cp="cp -vi"
alias rm="rm -v"
alias grep="grep -nsi --color"
alias h="history -300"
alias ha="history 0"
alias ll="ls -la --color=auto"
alias p="pwd"
alias sd="sudo"

# Help
#%(<condition>.<if true>.<if false>)
#%(?.%F{green}.%F{red})

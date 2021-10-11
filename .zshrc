autoload -Uz colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

PROMPT="%{${fg[blue]}%}[%n@%m]%{${reset_color}%} %~
%# "

autoload -Uz compinit
compinit

# vcs_info
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{yellow}!'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}+'
zstyle ':vcs_info:*' formats '%F{green}%c%u[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%b|%a]%f'

precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'


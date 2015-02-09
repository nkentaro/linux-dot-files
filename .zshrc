fpath=($HOME/.zsh-completions/src $fpath)

# programmable complement
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# directory stack
setopt AUTO_PUSHD

autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
# add-zsh-hook chpwd chpwd_recent_dirs

# backward delete word (^W) delimiters
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " _/-=;@:,|"
zstyle ':zle:*' word-style unspecified

#
zstyle ':completion:*:default' menu select=1
# spell check
setopt correct

#
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# switch candidate by TAB
setopt auto_menu

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# doesn't eliminate ending slash (/)
setopt noautoremoveslash

# prompt

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# zsh-git-prompt
# source ~/zsh-git-prompt/zshrc.sh

# PROMPT='%n:%~$ '
#PROMPT='[%n@%m]%~%# '
autoload -U promptinit
#PROMPTTTY=`tty | sed -e 's/^\/dev\///'`
#PROMPT="[%B${cyan}%~${default}%b] <%B${PROMPTTTY}%b> %E
#%b%# "
if [ `whoami` = root ]; then
    RPROMPT="${red}%B%n${default}%b@${logreen}%m${default}%b "

#else
#RPROMPT="${loyellow}%n${default}%b@${logreen}%m${default}%b"
fi
# SPROMPT="${red}Correct ${default}> '%r' [%BY%bes %BN%bo %BA%bbort %BE%bdit] ? "
#PROMPT="%n@%m:%/
#`date +%a` `date +%m`/`date +%d` %@ %h > "
autoload -U colors && colors
# PROMPT="%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%} "
# PROMPT="%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%M%{$reset_color%} in %{$fg_bold[green]%}%d%{$reset_color%}
PROMPT="%B%M:%~%b
%{$fg[magenta]%}%n%{$reset_color%}$ "


# emacs like key bind
bindkey -e

# zsh-syntax-highlighting
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Do not exit on ^D (end of file)
setopt IGNORE_EOF

# Disable output flow control via start/stop characters (^S/^Q)
setopt NO_FLOW_CONTROL

# Disable beep
setopt NO_BEEP

# incremental command search
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

# zmv
autoload -Uz zmv

# alias
alias h="history 1024"
alias j="jobs -l"
alias la="ls -a"
alias lf="ls -FA"
alias ll="ls -lA"
alias ls="ls -F"
alias rm="rm -i"
alias perle="perl -e"
alias ff="find . -name '*\!{*}*' -ls"
alias ramen3="sleep 180 && while true; do sleep 1 && say 'ramen ready'; done;"
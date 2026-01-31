export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
### Path
export PATH="$PATH:~/.dotfiles/scripts"

### Aliases
	alias ll="ls -lh"

	alias gs="git status"
	alias gc="git commit"

	alias sl=ls
	alias dc=cd

	alias mv="mv -i"           	# -i prompts before overwrite
	alias mkdir="mkdir -p"    	# -p make parent dirs as needed
	alias df="df -h"          	# -h prints human readable format

	alias la="ls -A"
	alias lla="la -l"
## Scripts
	alias marco=""

### Options
	setopt autocd 			# Autocd allows you to change directories without typing cd
	setopt EXTENDED_HISTORY		# EXTENDED_HISTORY adds timestamps to your history entries


# Auto complete command on up arrow
# Use standard key to determine up/down arrows
# This is more reliable than hardcoding escape sequences
autoload -Uz history-search-end
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search history-search-end
zle -N down-line-or-beginning-search history-search-end
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search

### Prompt Config
# enable vcs_info
autoload -Uz vcs_info
precmd() { vcs_info }
# config vcs for git
zstyle ':vcs_info:*' enable git
# Formats the branch name with yellow color, inside parentheses.
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%f'
# Define prompt
setopt prompt_subst
# Example prompt: green username/host, blue directory, then red git info.
PROMPT='%F{green}%n@%m%f %F{blue}%~%f ${vcs_info_msg_0_}$ '



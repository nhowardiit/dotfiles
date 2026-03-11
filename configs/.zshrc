export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
### Path
export PATH="$HOME/.dotfiles/scripts:$PATH"

### Aliases
	alias ll="ls -lh"

	alias sl=ls
	alias dc=cd

	alias mv="mv -i"           	# -i prompts before overwrite
	alias mkdir="mkdir -p"    	# -p make parent dirs as needed
	alias df="df -h"          	# -h prints human readable format

	alias la="ls -A"
	alias lla="la -l"

	alias gs="git status"
	alias ga="git add"
	alias ga="git commit -m"
	alias gp="git push"
## Scripts

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
autoload -Uz vcs_info
setopt PROMPT_SUBST     # Allows functions in prompt string

parseVCS () {
	if [[ -n ${vcs_info_msg_0_} ]]; then
		if [[ -n $(git status --porcelain 2>/dev/null) ]]; then	
		      echo "%F{red}${vcs_info_msg_0_}%f " 
        else
		      echo "%F{green}${vcs_info_msg_0_}%f " 
        fi
    else
	   echo ""
    fi
}

NEWLINE=$'\n'
precmd() {
    vcs_info
	RPROMPT='%F{green}%n%F{orange}@%F{yellow}%m'
    PROMPT='%F{7}%~%f ${NEWLINE}$(parseVCS)%f%# '
}

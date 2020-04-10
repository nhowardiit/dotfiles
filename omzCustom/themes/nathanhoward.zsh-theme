#Custom oh-my-zsh theme made by Nathan Howard

#Color definitions
#Based on Solaized in CONEMU
local grey="%{$fg_bold[black]%}"
local green="%{$fg_bold[green]%}"
local grey2="%{$fg_bold[red]%}"
local cyan="%{$fg_bold[cyan]%}"
local yellow="%{$fg_bold[yellow]%}"
local blue="%{$fg_bold[blue]%}"
local magenta="%{$fg_bold[magenta]%}"
local white="%{$fg_bold[white]%}"
local reset="%{$reset_color%}"

# definitions
typeset +H _current_dir="$grey%~$reset"
typeset +H _current_host="$green%n$grey@$magenta%m$reset"

PROMPT='$(git_prompt_info)${_current_dir}
$grey>>>$reset'

#RPROMPT='%{$fg_bold[green]%n%{$fg_bold[black]@%{$fg_bold[magenta]%m'
#RPROMPT='%n@%m'
RPROMPT='$_current_host'

# Git prompt settings
ZSH_THEME_GIT_PROMPT_PREFIX="$cyan"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset | "
ZSH_THEME_GIT_PROMPT_DIRTY=" $red✘$reset"
ZSH_THEME_GIT_PROMPT_CLEAN=" $green✔$reset"

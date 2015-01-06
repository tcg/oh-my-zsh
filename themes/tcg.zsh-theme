# tcg theme
# Inspired by elements from "minimal", "eastwood", "avit".
# Reference stuff:
#   Refcard: http://www.bash2zsh.com/zsh_refcard/refcard.pdf
#   http://www.nparikh.org/unix/prompt.php#zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT='$(git_custom_status)%{$fg[cyan]%}[%~% ]%{$reset_color%}
%B$%b '
#PROMPT='$(git_custom_status)%{$fg[cyan]%}[%1~% ]%{$reset_color%}%B$%b '

#RPROMPT='%{$reset_color%}%{$fg[red]%}%t%{$reset_color%}'
# The following 'echotc' commands raise and lower the line that this info is
# printed to. I do not fully understand them myself. Inspired by: AVIT theme.
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/avit.zsh-theme
RPROMPT='%{$(echotc UP 1)%}%{$reset_color%}%{$fg[red]%}%t%{$reset_color%}%{$(echotc DO 1)%}'


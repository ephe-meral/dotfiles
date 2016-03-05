PROMPT=$'
%{$fg_bold[blue]%}[%{$reset_color%}%{$fg[blue]%}%m%{$fg_bold[blue]%}:%{$reset_color%}%{$fg[red]%}%15<...<%~%<<%{$reset_color%}%{$fg[white]%}$(git_prompt_info)%{$fg_bold[blue]%}]
%{$fg_bold[blue]%}[%{$reset_color%}%{$fg[blue]%}%n%{$fg_bold[blue]%}] >%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

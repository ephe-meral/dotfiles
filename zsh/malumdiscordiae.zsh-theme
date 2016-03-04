# roughly based on the frisk theme
PROMPT=$'
%{$fg_bold[grey]%}[%{$reset_color%}%{$fg[grey]%}%m%{$fg_bold[grey]%}:%{$reset_color%}%{$fg[red]%}%15<...<%~%<<%{$reset_color%}%{$fg[white]%}$(git_prompt_info)%{$fg_bold[grey]%}]
%{$fg_bold[grey]%}[%{$reset_color%}%{$fg[grey]%}%n%{$fg_bold[grey]%}] >%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[grey]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

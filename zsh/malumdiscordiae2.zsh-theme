# Note that LC_ALL should be set to a UTF-8 compatible format, e.g.
# echo "export LC_ALL=en_US.UTF-8" >> $HOME/.zshrc

# General prompt colors (foreground, highlight & git)
ZSH_PROMPT_PRFG="blue"
ZSH_PROMPT_PRHL="red"
ZSH_PROMPT_PRHL2="green"

# Prompt character, git dirty, git clean, no-git
ZSH_PROMPT_PRCH='>'
ZSH_PROMPT_PRGITD='%{$fg_bold[$ZSH_PROMPT_PRHL]%}$ZSH_PROMPT_PRCH%{$reset_color%}'
ZSH_PROMPT_PRGITC='%{$fg_bold[$ZSH_PROMPT_PRHL2]%}$ZSH_PROMPT_PRCH%{$reset_color%}'
ZSH_PROMPT_PRGITN=$ZSH_PROMPT_PRCH

# Shortened if terminal smaller than this width
ZSH_PROMPT_SHORT=60


# Prints user & machine
function user_machine_prompt {
  local SEP='%{$fg_bold[$ZSH_PROMPT_PRFG]%}@%{$reset_color%}'
  local USER_SHORT='%{$fg[$ZSH_PROMPT_PRFG]%}%4>~>%n%>>%{$reset_color%}'
  local MACH_SHORT='%{$fg[$ZSH_PROMPT_PRFG]%}%4>~>%m%>>%{$reset_color%}'
  local USER_LONG='%{$fg[$ZSH_PROMPT_PRFG]%}%n%{$reset_color%}'
  local MACH_LONG='%{$fg[$ZSH_PROMPT_PRFG]%}%m%{$reset_color%}'
  # use~@mac~
  local USER_MACHINE_SHORT='$(print -P $USER_SHORT)$(print -P $SEP)$(print -P $MACH_SHORT)'
  # user@machine
  local USER_MACHINE_LONG='$(print -P $USER_LONG)$(print -P $SEP)$(print -P $MACH_LONG)'

  [[ ( $COLUMNS -lt $ZSH_PROMPT_SHORT ) ]] && print -P $USER_MACHINE_SHORT && return
  print -P $USER_MACHINE_LONG
}


# Directory
function directory_prompt {
  local DIR_SHORT='%{$fg[$ZSH_PROMPT_PRHL]%}%10<…<%d%<<%{$reset_color%}'
  local DIR_LONG='%{$fg[$ZSH_PROMPT_PRHL]%}%15<…<%d%<<%{$reset_color%}'

  [[ ( $COLUMNS -lt $ZSH_PROMPT_SHORT ) ]] && print -P $DIR_SHORT && return
  print -P $DIR_LONG
}


# GIT related
function is_git_dir {
  git branch >/dev/null 2>/dev/null && echo '1' && return
}
function git_prompt_char {
  if [[ -n `is_git_dir` ]]; then
    # if the repo is dirty...
    [[ -n `git status --porcelain` ]] && print -P $ZSH_PROMPT_PRGITD && return
    print -P $ZSH_PROMPT_PRGITC
  else
    print -P $ZSH_PROMPT_PRGITN
  fi
}

# Prompt character will be red if we have root capabilities
function term_prompt_chars {
  local GIT_PROMPT=$(print -P `git_prompt_char`)
  print -P '$GIT_PROMPT%{%(!.$fg_bold[$ZSH_PROMPT_PRHL].$fg_bold[$ZSH_PROMPT_PRFG])%}$ZSH_PROMPT_PRCH%{$reset_color%}'
}

PROMPT='%{$fg_bold[$ZSH_PROMPT_PRFG]%}[%{$reset_color%}$(user_machine_prompt)%{$fg_bold[$ZSH_PROMPT_PRFG]%}:%{$reset_color%}$(directory_prompt)%{$fg_bold[$ZSH_PROMPT_PRFG]%}]%{$reset_color%} $(term_prompt_chars) '

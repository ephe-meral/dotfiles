# Note that LC_ALL should be set to a UTF-8 compatible format, e.g.
# echo "export LC_ALL=en_US.UTF-8" >> $HOME/.zshrc

# General prompt colors (foreground, highlight & git)
ZSH_PROMPT_PRFG="white"
ZSH_PROMPT_PRHL="red"
ZSH_PROMPT_PRHL2="green"

# Prompt character, git dirty, git clean, no-git
ZSH_PROMPT_PRCH='>'
ZSH_PROMPT_PRGITD='%{$fg[$ZSH_PROMPT_PRHL]%}$ZSH_PROMPT_PRCH%{$reset_color%}'
ZSH_PROMPT_PRGITC='%{$fg[$ZSH_PROMPT_PRHL2]%}$ZSH_PROMPT_PRCH%{$reset_color%}'
ZSH_PROMPT_PRGITN=$ZSH_PROMPT_PRCH


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

PROMPT='$(term_prompt_chars) '

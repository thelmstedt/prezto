zstyle ':prezto:*:*' color 'yes'

if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':prezto:*:*' color 'no'
  zstyle ':prezto:module:prompt' theme 'off'
fi

#
# Grep
#
export GREP_COLOR='37;45'           # BSD.
export GREP_COLORS="mt=$GREP_COLOR" # GNU.
alias grep="${aliases[grep]:-grep} --color=auto"

#
# ls
#

if is-callable 'dircolors'; then
  # GNU Core Utilities
  alias ls='ls --group-directories-first'
  eval "$(dircolors --sh)"
  alias ls="${aliases[ls]:-ls} --color=auto"
else
  # BSD Core Utilities
  export LSCOLORS='exfxcxdxbxGxDxabagacad'
  # Define colors for the completion system.
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
  alias ls="${aliases[ls]:-ls} -G"
fi


#
# Man coloring
#

export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

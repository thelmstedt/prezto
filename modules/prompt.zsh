zstyle ':prezto:module:prompt' theme 'thelm'

#
# prompt
#
# Load and execute the prompt theming system.
autoload -Uz prompt_thelm_setup
autoload -Uz promptinit && promptinit
# Load the prompt theme.
zstyle -a ':prezto:module:prompt' theme 'prompt_argv'
if [[ "$TERM" == (dumb|linux|*bsd*) ]] || (( $#prompt_argv < 1 )); then
  prompt 'off'
else
  prompt "$prompt_argv[@]"
fi
unset prompt_argv

[[ -s "${ZDOTDIR:-$HOME}/bin" ]] && PATH=$PATH:${ZDOTDIR:-$HOME}/bin
[[ -s "${ZDOTDIR:-$HOME}/.local/bin" ]] && PATH=$PATH:${ZDOTDIR:-$HOME}/.local/bin

# Haskell
[[ -s "${ZDOTDIR:-$HOME}/.cabal/bin" ]] && PATH=${ZDOTDIR:-$HOME}/.cabal/bin:$PATH
[[ -s "${ZDOTDIR:-$HOME}/.local/bin" ]] && PATH=${ZDOTDIR:-$HOME}/.local/bin:$PATH
# Python
[[ -s "${ZDOTDIR:-$HOME}/.pythonrc.py" ]] && export PYTHONSTARTUP="${ZDOTDIR:-$HOME}/.pythonrc.py"

#Java
[[ -s "/usr/libexec/java_home" ]] && export JAVA_HOME="$(/usr/libexec/java_home)"
export MAVEN_OPTS=" -Xmx1024m -XX:MaxPermSize=256m -Dmaven.artifact.threads=20 -Djava.awt.headless=true"
export ES_JAVA_OPTS='-Xmx2g -Xms2g' #ES5

export USER_HOME="${ZDOTDIR:-$HOME}"
export GRADLE_USER_HOME="${ZDOTDIR:-$HOME}/.gradle"

#Editors
export GIT_EDITOR="emacsclient -a ''"
export EDITOR="emacsclient -a ''"

# Machine Specific
[[ -s "${ZDOTDIR:-$HOME}/.machineconf" ]] && source "${ZDOTDIR:-$HOME}/.machineconf"
[[ -s "${ZDOTDIR:-$HOME}/.private" ]] && source "${ZDOTDIR:-$HOME}/.private"
[[ -s "${ZDOTDIR:-$HOME}/.private_env" ]] && source "${ZDOTDIR:-$HOME}/.private_env"


# editor
export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


# language
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

#
# Directory
#

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>. Use >! and >>! to bypass.
unsetopt correct

#
# Environment
#

# Note: requires zsh >= 5.2
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

setopt COMBINING_CHARS      # Combine zero-length punctuation characters (accents) with the base character.
setopt INTERACTIVE_COMMENTS # Enable comments in interactive shell.
setopt RC_QUOTES            # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt MAIL_WARNING       # Don't print a warning message if a mail file has been accessed.

#
# Jobs
#

setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# TODO detect firefox-nightly, firefox, chromium, google-chrome in that order

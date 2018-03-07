
function git_no_matching_remotes() {
    for x in $(git branch); git show-branch remotes/origin/${x} &> /dev/null || echo ${x}
}


function go_temp() {
    cd $(mktemp -d)
}
alias gt=go_temp

function upto() {
    local EXPRESSION="$1"
	  if [ -z "$EXPRESSION" ]; then
		    echo "A folder expression must be provided." >&2
		    return 1
	  fi
	  local CURRENT_FOLDER="$(pwd)"
	  local MATCHED_DIR=""
	  local MATCHING=true

	  while [ "$MATCHING" = true ]; do
	      IGNORE_HOME=$(echo "$CURRENT_FOLDER" | sed "s|$HOME||") # we never want to go back to home
	      if [[ "$CURRENT_FOLDER" == "$HOME" ]] ; then # stop at home
	          MATCHING=false
		    elif [[ "$IGNORE_HOME" =~ "$EXPRESSION" ]] ; then
			      MATCHED_DIR="$CURRENT_FOLDER"
			      CURRENT_FOLDER="$(dirname ${CURRENT_FOLDER})"
		    else
			      MATCHING=false
		    fi
	  done
	  if [ -n "$MATCHED_DIR" ]; then
		    cd ${MATCHED_DIR}
	  else
		    echo "No Match." >&2
		    return 1
	  fi
}
alias u=upto

function awk_column() {
  local cmd="{print \$$1}"
  awk ${cmd}
}

alias ac=awk_column

function awk_trim() {
  awk '{$1=$1;print}'
}
alias trim=awk_trim

#
# Safe ops. Ask the user before doing anything destructive.
#
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# utils
alias l="exa"
alias ll="exa -l --git"

# git
alias g="git"
alias gs="git status --short"
alias e="emacsclient -t"
alias gp="git pull --ff-only"


# Maven
alias -g md='MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n $MAVEN_OPTS " '
alias m='mvn install -DskipTests'
alias mc="mvn clean install -DskipTests"
alias mct="mvn clean install"
alias mt="mvn install"
alias mvd="mvn dependency:tree"

# Gradle
alias -g gd='GRADLE_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=y $GRADLE_OPTS " '
alias -g gbd='GRADLE_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 $GRADLE_OPTS"'
alias -g tc="-Delasticsearch.testCluster=true"
alias -g nt="-xcheck -xtest"
alias r='gradle'
alias ras='gradle appRun'
alias rbr='gradle bootRun'
alias rbt='gradle bootRun -Delasticsearch.testCluster=true'

# Project aliases
alias w="cd $HOME/work"
alias b="cd $HOME/work/fetch"
alias c="cd $HOME/work/fetch-admin/ansible"
alias gbw='(grunt build || true) && grunt watch'


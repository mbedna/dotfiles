cd ~

if [ -f "${HOME}/.bashrc_local" ]; then
  source "${HOME}/.bashrc_local"
fi

if [ -f "${HOME}/.bash_variables" ]; then
  source "${HOME}/.bash_variables"
fi

#export LC_ALL="pl_PL.ISO-8859-2"
#export LANGUAGE="pl_PL.ISO-8859-2"

export LC_ALL="pl_PL.UTF-8"
export LANGUAGE="pl_PL.UTF-8"

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
  PATH="${HOME}/bin/defra:${PATH}"
  PATH="${HOME}/bin/smart:${PATH}"
  PATH="${HOME}/bin/mojapg:${PATH}"
  PATH="${HOME}/bin/most:${PATH}"
  PATH="${HOME}/bin/es:${PATH}"
  PATH="${HOME}/bin/git:${PATH}"
  PATH="${HOME}/bin/grep:${PATH}"
  PATH="${HOME}/bin/java:${PATH}"
  PATH="${HOME}/bin/kill:${PATH}"
  PATH="${HOME}/bin/lsof:${PATH}"
  PATH="${HOME}/bin/php:${PATH}"
  PATH="${HOME}/bin/pmi:${PATH}"
  PATH="${HOME}/bin/svn:${PATH}"
fi
PATH="$TOOLS/vim/bin:$TOOLS/git/bin:$TOOLS/screen/bin:/usr/local/bin:/bin:$JAVA_HOME/bin:$SCALA_HOME/bin:$MOZILLA_HOME:/usr/sbin:$ES_HOME/bin:${PATH}"
PATH="$TOOLS/copy/x86:$TOOLS/SoapUI/bin:${PATH}"
PATH="$ECLIPSE_HOME:${PATH}"
export PATH=$PATH:$M2_HOME/bin
export PATH=$PATH:$SBT_HOME
export PATH=$PATH:$MONGODB_HOME
export PATH=$PATH:$ANT_HOME/bin
export PATH=$PATH:$GANT_HOME/bin
export PATH=$PATH:~/repo/mbedna/bin
export PATH=$PATH
export PATH=$PATH:$TOOLS/acrobat/Adobe/Reader9/bin
export PATH=$PATH:$TOOLS/edeklaracje/e-Deklaracje/bin
export PATH=$PATH:$TOOLS/foreman/bin
export PATH=$PATH:$PROJECTS/capd-project/usefulScripts

#export PATH="${PATH}$(find /opt -name '.*' -prune -o -type d -printf ':%p')"
export EDITOR=/usr/bin/vim

CYGWIN="${CYGWIN} server nodosfilewarning winsymlinks"; export CYGWIN

set -o vi
alias vi=vim
alias g='git'
# alias screen='TERM=screen-256color screen bash'
alias phpu='phpunit -v --debug --group=unit'
alias phpv='phpunit -v --debug --group=validation'
alias phpd='phpunit -v --debug --group=database'
alias phpc='phpunit -v --debug --group=controller'

alias doctrineu='php app/console doctrine:schema:update --force'
alias doctrined='php app/console doctrine:schema:drop --force'
alias doctrinec='php app/console doctrine:schema:create'
alias doctrinedc='php app/console doctrine:schema:drop --force; php app/console doctrine:schema:create'

function phpf() { 
    phpunit -v --debug --filter=$1
}

function startnginx() { 
    goops;
    sudo make refresh-nginx
 }

export MBEDNA="$PROJECTS/mbedna"
alias gotdd="cd $MBEDNA/tdd"
alias gojavacompiler="cd $MBEDNA/javacompiler"
alias gosingletest="cd $MBEDNA/singletest"
alias gocopy="cd /opt/Copy"
alias gowww="cd /var/www"


alias mc='mvn compile'
alias mtc='mvn test-compile'
alias mctc='mvn clean test-compile'
alias mcc='mvn clean compile'
alias mci='mvn clean install'
alias mcist='mvn clean install -DskipTests'
alias mciit='mvn clean install -DskipITs=false'
alias mcob='mvn cobertura:cobertura'
alias mff='mvn findbugs:findbugs'
alias mfc='mvn findbugs:check'
alias mfg='mvn findbugs:gui'
alias mee='mvn eclipse:eclipse -DdownloadSources -DdownloadJavadocs'
alias mec='mvn eclipse:clean'
alias mdt='mvn dependency:tree' 
alias mdbc='mvn dependency:build-classpath' 
alias mag='mvn archetype:generate' 
function mcej() { 
    echo ${*:2};
    mvn compile exec:java -Dexec.mainClass=$1 -Dexec.arguments=${*:2};
 }
#alias mdu='mvn dependency:unpack-dependencies -Dclassifier=sources -Dmdep.failOnMissingClassifierArtifact=false'
function mdu() { mvn dependency:unpack-dependencies -Dclassifier=sources -Dmdep.failOnMissingClassifierArtifact=false -DincludeArtifactIds="$@"; }

function mt() { mvn test; }
function mtv() { mvn "-Dtest=*ValidationTest.java" test; }
alias mit='mvn -DskipITs=false integration-test'
alias mgs='mvn generate-sources'

if [ -f ./sbt ]; then
    alias sccg='./sbt -mem 4000 clean compile test:compile gen-idea'
    alias sccd='./sbt -mem 4000 clean compile test:compile dist'
    alias st='./sbt test'
    alias sa='./sbt assembly'
    alias secdc='./sbt "export compile:dependency-classpath"'
    alias spl='./sbt publish-local'
    alias scc='./sbt -mem 4000 clean compile'
    alias sg='./sbt gen-idea'
else
    alias sccg='sbt -mem 4000 clean compile test:compile gen-idea'
    alias sccd='sbt -mem 4000 clean compile test:compile dist'
    alias st='sbt test'
    alias sa='sbt assembly'
    alias secdc='sbt "export compile:dependency-classpath"'
    alias spl='sbt publish-local'
    alias scc='sbt -mem 4000 clean compile'
    alias sg='sbt gen-idea'
fi

alias gomaven='cd $M2_HOME'
alias pstomcat='ps aux | grep java'  
#alias gobin='cd $TOMCAT_HOME/bin' 
alias gobin='cd ~/bin' 
alias gorepombedna='cd ~/repo/mbedna' 
alias gorepobin='cd ~/repo/mbedna/bin' 
export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket
alias start='cd $TOMCAT_HOME/bin;./catalina.sh jpda start' 
alias stop='cd $TOMCAT_HOME/bin;./catalina.sh stop' 
alias taillog='tail -f $TOMCAT_HOME/logs/catalina.out' 
alias startapache='/usr/sbin/apachectl2 -k start'
alias stopapache='/usr/sbin/apachectl2 -k stop'

alias pt='phpunit --configuration app/phpunit.xml.dist'

alias sshkeyfingerprint='ssh-keygen -lf ~/.ssh/id_rsa.pub'
alias gitclonesample='git clone ssh://git@altssh.bitbucket.org:443/mbedna/ydp-edugine.test.git'
alias gitclonesample2='git clone ssh://git@altssh.bitbucket.org:443/ydp/edugine.app.didactus.git'

export PMI_WAR_PATH=$WORKSPACEPMI/trunk/JAVA/target/spice.war
export TOMCAT_DEPLOY=$TOMCAT_HOME/webapps
alias cppmitrunkd2='rm -rf $TOMCAT_DEPLOY/pmi_*;cp $PMI_WAR_PATH $TOMCAT_DEPLOY/pmi_d2.war' 
alias cppmitrunkd4='rm -rf $TOMCAT_DEPLOY/pmi_*;cp $PMI_WAR_PATH $TOMCAT_DEPLOY/pmi_d4.war' 
alias cppmitrunkd5='rm -rf $TOMCAT_DEPLOY/pmi_*;cp $PMI_WAR_PATH $TOMCAT_DEPLOY/pmi_d5.war' 
alias cppmitrunkt3='rm -rf $TOMCAT_DEPLOY/pmi_*;cp $PMI_WAR_PATH $TOMCAT_DEPLOY/pmi_t3.war' 
alias cppmitrunki1='rm -rf $TOMCAT_DEPLOY/pmi_*;cp $PMI_WAR_PATH $TOMCAT_DEPLOY/pmi_i1.war' 
alias cppmitrunki2='rm -rf $TOMCAT_DEPLOY/pmi_*;cp $PMI_WAR_PATH $TOMCAT_DEPLOY/pmi_i2.war' 
alias cppmitrunku1='rm -rf $TOMCAT_DEPLOY/pmi_*;cp $PMI_WAR_PATH $TOMCAT_DEPLOY/pmi_u1.war' 
alias mvpmitrunkwar='cp $PMI_WAR_PATH $WORKSPACEPMI/trunk/JAVA/deploy/pmi_xy.war' 

#alias psjboss='ps aux | grep jboss'  
#alias gobin='cd $JBOSS_HOME/bin' 
#alias godeploydev='cd $JBOSS_HOME/server/dev/deploy' 
#alias gologdev='cd $JBOSS_HOME/server/dev/log' 
#alias rmlogdev='cd $JBOSS_HOME/server/dev/log; rm -rf *.log' 
#alias startdev='rm -rf $JBOSS_HOME/server/dev/log;rm -rf $JBOSS_HOME/server/dev/data;rm -rf $JBOSS_HOME/server/dev/tmp;rm -rf $JBOSS_HOME/server/dev/work;cd $JBOSS_HOME/bin;./run.sh -c dev' 
#alias stopdev='$JBOSS_HOME/bin/shutdown.sh -r 1090' 
#alias taillogdev='tail -f $JBOSS_HOME/server/dev/log/server.log' 

alias svnpropget='svn propget svn:ignore . > temp'
alias svnpropset='svn propset svn:ignore -F temp .'

alias reloadx='xrdb -load ~/.Xresources' 

alias findlastmodified='find . -type f -printf "%T@ %p\n" | sort -n | tail -1 | cut -f2- -d" "'

# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [ -n "${BASH_VERSION}" ]; then
  [ -z "$PS1" ] && return

  # don't put duplicate lines or lines starting with space in the history.
  # See bash(1) for more options
  HISTCONTROL=ignoreboth
  
  # append to the history file, don't overwrite it
  shopt -s histappend
  
  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=10000
  HISTFILESIZE=20000
  
  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize
  # If set, the pattern "**" used in a pathname expansion context will
  # match all files and zero or more directories and subdirectories.
  #shopt -s globstar
  
  # make less more friendly for non-text input files, see lesspipe(1)
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
  
  # set variable identifying the chroot you work in (used in the prompt below)
  if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
      debian_chroot=$(cat /etc/debian_chroot)
  fi
  
  # set a fancy prompt (non-color, unless we know we "want" color)
  case "$TERM" in
      xterm-color) color_prompt=yes;;
  esac
  
  # uncomment for a colored prompt, if the terminal has the capability; turned
  # off by default to not distract the user: the focus in a terminal window
  # should be on the output of commands, not on the prompt
  #force_color_prompt=yes
  
  if [ -n "$force_color_prompt" ]; then
      if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  	# We have color support; assume it's compliant with Ecma-48
  	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  	# a case would tend to support setf rather than setaf.)
  	color_prompt=yes
      else
  	color_prompt=
      fi
  fi
  
  if [ "$color_prompt" = yes ]; then
      PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  else
      PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
  fi
  unset color_prompt force_color_prompt
  
  # If this is an xterm set the title to user@host:dir
  case "$TERM" in
  xterm*|rxvt*)
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
      ;;
  *)
      ;;
  esac
  
  #PS1="[\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]:)\"; else echo \"\[\033[01;31m\]:(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[00;35m\]\u@\h'; fi)\[\033[01;33m\] \W \$\[\033[00m\]] "
  #PS1="[\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;\]:)\"; else echo \"\[\033[01;\]:(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[00;35m\]\u@\h'; fi)\[\033[01;33m\] \W \$\[\033[00m\]] "
  
  # enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
      test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
      alias ls='ls --color=auto'
      #alias dir='dir --color=auto'
      #alias vdir='vdir --color=auto'
  
      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
  fi
  
  # Add an "alert" alias for long running commands.  Use like so:
  #   sleep 10; alert
  alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

fi
# Special screens
# $1 - screen config file name
function scr(){
    screen -c ~/.screenrc.$1
}
LS_COLORS="ow=01;90:di=01;90"
export LS_COLORS

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

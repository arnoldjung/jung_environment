# ================
# arnold's .bashrc
# ================

# VirtualBox
# {{{
# sudo mount -t vboxsf SHARED ~/SHARED/
  VBOX_SHARED_DIR='/home/arnold/SHARED'
  alias shared='cd $VBOX_SHARED_DIR'
  function mvToShared() {
    mv $@ $VBOX_SHARED_DIR
  }
  function cpToShared() {
    cp $@ $VBOX_SHARED_DIR
  }
# }}}

# notes {{{
  function show_common() {
      echo " read each line of a file, instead of tokens separated by space"
      echo "   while read line; do echo "line: $line" ; done < someFile.txt"
  }
# }}}

# bash settings {{{
  stty -ctlecho
  shopt -s checkwinsize
  shopt -s histappend
  shopt -s extglob
  shopt -u dotglob
  shopt -s cdspell
  export IGNOREEOF=1
  
  HISTCONTROL=ignoredups
  # no limit to how long of history to keep
  unset HISTFILESIZE
  export HISTTIMEFORMAT="%Y-%m-%d %H:%M "
# }}}

# env settings{{{
  PATH=$PATH
  PATH=/home/arnold/tools/jdk1.7.0_45/bin:$PATH
  PATH=/home/arnold/tools/node-v0.10.23/:$PATH
  PATH=/home/arnold/bin:$PATH
  JAVA_HOME=/home/arnold/tools/jdk1.7.0_45/
  
  export EDITOR='gvim -f'
  export VISUAL='gvim -f'
  export PAGER='less'
# }}}

# linux aliases {{{
  alias bashrc='echo "sourcing .bashrc" && source ~/.bashrc'
  alias bashrcw='g ~/.bashrc; read -p "source .bashrc? (y/n): "; [ "$REPLY" == "y" ] && bashrc'
  alias cd-='cd -'
  alias shistory='history | tail -n50'
  alias filter='grep -v'
  alias lspwd='find `pwd` -maxdepth 1 | sort'
  alias duh='du -h '
  alias dush='du -sh '
  alias f='find . -name'
  alias ltr='ll -ltr'
  alias cp='cp -i'
  alias rm='rm -i'
  alias mv='mv -i'
  alias ll='ls -l --color=auto'
  alias llh='ll -h'
  alias lsdir='ls -L1p | grep /'
  alias psme='ps U arnold'
  alias psall='ps axf'
  alias pwd='pwd -P'
  alias tree='tree -C --dirsfirst'
  alias lastcol="awk '{print \$NF;}'"
  alias less='less --force -R --ignore-case --long-prompt'
# }}}

# util aliases{{{
  bak() { mv $1 $1.$(date +%F).bak; }
  alias iotop='iotop -d 3 -oa'
  alias g='gvim'
  alias g-='g -'
  alias gdiff='gvimdiff'
  alias ungzip='gunzip'
  alias k-='kompare -'
  alias msg='kdialog --msgbox'
  alias wnbdeluxe='javaws http://www.fatbread.com/yawni.jnlp'
  alias treemap='gdmap'
  alias lastlog='ls -tr ~/logs | tail -n5; g ~/logs/`ls -tr ~/logs | tail -n1`'
# }}}

# git-svn commands
  function show_gitsvn() {
      echo "to clone  : git svn clone https://sami.cdt.int.thomsonreuters.com/svn/taml_taml/trunk/projects/SOME_PROJECT"
      echo "(with rev): git svn clone -s -r 40000:HEAD https://sami.cdt.int.thomsonreuters.com/svn/taml_taml/trunk/projects/SOME_PROJECT"
      echo "to update : git svn rebase"
      echo "to commit : git svn dcommit"
  }

# git {{{
  alias gits='git status'
  alias gitrevdiff='git log -p -M -C --follow'
  #for comparing local disk version to repository
  alias gitdiffR='git diff origin/$(git branch | grep "^\*" | cut -c3-)'
  alias gitinfo='git diff HEAD..origin --name-status'

  # git colors
  git config --global color.branch auto
  git config --global color.diff auto
  git config --global color.interactive auto
  git config --global color.status auto
# }}}

# svn {{{
  svn() {
    if [ x"$1" = xdiff ] || [ x"$1" = xdi ]; then
      /usr/bin/svn "$@" | less
    elif [ x"$1" = xlog ] ; then
      /usr/bin/svn "$@" | less
    else
      /usr/bin/svn "$@"
    fi
  }
  alias svnstatus='svn status'
  alias svns='svn status'
  alias s='svns'
  alias sdiff='svn diff | less'
  function svnrevdiff() {
      svn log --diff $@ | less
  }
  function show_svn() {
      echo "svn import . https://sami.cdt.int.thomsonreuters.com/svn/taml_taml/trunk/projects/MY_NEW_PROJECT"
      echo "svn checkout https://sami.cdt.int.thomsonreuters.com/svn/taml_taml/trunk/projects/MY_NEW_PROJECT"
  }
# }}}

# maven {{{
  export M2_HOME=/home/arnold/tools/apache-maven-3.1.1
  export M2=$M2_HOME/bin
  PATH=$M2:$PATH
  PATH=./:$PATH
  alias mvncheck='mvn versions:display-dependency-updates'
  alias depTree='mvn dependency:tree | g-'
  alias depTreeVerbose='mvn -Dverbose=true dependency:tree | g-'
  unittest() { mvn test -Dtest=$1 ; }
  unittestclean() { mvn clean test -Dtest=$1 ; }

  alias mm='mvn install -U'
  alias mmci='mvn clean install findbugs:findbugs -U'

  alias runjava='java -cp target/*-jar-with-dependencies.jar'
# }}}

# prompt {{{
  SET_PROMPT_COLOR='\[\033[0;36m\]'
  SET_PROMPT_COLOR2='\[\033[0;32m\]'
  END_PROMPT_COLOR='\[\e[0m\]'
  #PS1="$SET_PROMPT_COLOR\t[\u@\h \W]\$ $END_PROMPT_COLO"
  PS1="$SET_PROMPT_COLOR[\w] \t$END_PROMPT_COLOR"
  PS1="\n$PS1\n$SET_PROMPT_COLOR2[\W@\h]$ $END_PROMPT_COLOR"
  #set color scheme
  #eval `dircolors ~/.coloursrc`
# }}}

# ruby {{{
 source /home/arnold/.rvm/scripts/rvm
# }}}

# review board {{{
 alias postReview='rbt post --target-groups=taml'
# }}}

# personal aliases {{{
  alias src='cd ~/svn'
  alias ner='cd ~/svn/NamedEntityRecognition'
  alias tss='cd ~/svn/TwitterSearchService'
  source /home/arnold/bin/arnold_scripts.rc

  # NOTES {{{
    function n() {
      if [ -z $1 ]
      then
        ll ~/notes
      elif [ $1 == "edit" ]
      then
        gvim ~/notes/$2
      else
        cat ~/notes/$1
      fi
    }
    alias notes='n'
  # }}}
# }}}



#vim:foldmethod=marker 

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

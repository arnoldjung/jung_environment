# ================
# arnold's .bashrc
# ================

stty -ctlecho

# various environment settings
shopt -s checkwinsize
shopt -s histappend
shopt -s extglob
shopt -u dotglob
shopt -s cdspell
HISTCONTROL=ignoredups
export IGNOREEOF=1

#read each line of a file, instead of tokens separated by space
# while read line; do echo $line; echo "$line" ; done < someFile.txt

#echo "[init .bashrc]"
PATH=$PATH

export EDITOR='gvim -f'
export VISUAL='gvim -f'
export PAGER='less'

# no limit to how long of history to keep
unset HISTFILESIZE
export HISTTIMEFORMAT="%Y-%m-%d %H:%M "

#luke
alias lastcol="awk '{print \$NF;}'"

#GIT ALIASES
alias gits='git status'

#for comparing local disk version to repository
alias gitdiffR='git diff origin/$(git branch | grep "^\*" | cut -c3-)'

alias gitinfo='git diff HEAD..origin --name-status'
alias gitrevdiff='git log -p -M -C --follow'

#ALIASES
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
alias mvncheck='mvn versions:display-dependency-updates'
alias iotop='iotop -d 3 -oa'
alias treemap='gdmap'
alias lastlog='ls -tr ~/logs | tail -n5; g ~/logs/`ls -tr ~/logs | tail -n1`'

#resets console errors
alias stty-recover='stty echo icrnl icanon'

alias g='gvim'
alias g-='g -'
alias gdiff='gvimdiff'
alias ungzip='gunzip'
alias k-='kompare -'
alias msg='kdialog --msgbox'
alias zkm='java -Xmx1g -jar /usr/local/devh/jars/ZKM.jar'
alias wnbdeluxe='javaws http://www.fatbread.com/yawni.jnlp'
alias depTree='mvn dependency:tree | g-'
alias depTreeVerbose='mvn -Dverbose=true dependency:tree | g-'

unittest() { mvn test -Dtest=$1 ; }
unittestclean() { mvn clean test -Dtest=$1 ; }

alias less='less --force -R --ignore-case --long-prompt'

#Prompt stuff
SET_PROMPT_COLOR='\[\033[0;36m\]'
SET_PROMPT_COLOR2='\[\033[0;32m\]'
END_PROMPT_COLOR='\[\e[0m\]'
#PS1="$SET_PROMPT_COLOR\t[\u@\h \W]\$ $END_PROMPT_COLO"
PS1="$SET_PROMPT_COLOR[\w] \t$END_PROMPT_COLOR"
PS1="$PS1\n$SET_PROMPT_COLOR2[\W@\h]$ $END_PROMPT_COLOR"

#set color scheme
#eval `dircolors ~/.coloursrc`


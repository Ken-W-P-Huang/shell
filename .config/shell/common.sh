#######################################################################################################################
#  XDG
########################################################################################################################
if [ ! -v XDG_CONFIG_HOME ]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi
if [ ! -v XDG_CACHE_HOME ]; then
    export XDG_CACHE_HOME="$HOME/.cache"
fi
if [ ! -v XDG_DATA_HOME ]; then
    export XDG_DATA_HOME="$HOME/.local/share"
fi
if [ ! -v XDG_RUNTIME_DIR ]; then
    export XDG_RUNTIME_DIR="${TMPDIR:-/tmp}/runtime-$USER"
    mkdir -pv $XDG_RUNTIME_DIR
fi
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE="$XDG_DATA_HOME/lesshst"
export REDISCLI_HISTFILE="$XDG_DATA_HOME/rediscli_history"
export BUNDLE_USER_CONFIG="${XDG_CONFIG_HOME}/bundle"
export BUNDLE_USER_CACHE="${XDG_CACHE_HOME}/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker/machine"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export HTOPRC="${XDG_CONFIG_HOME}/htop/htoprc"
export PACKER_CONFIG="${XDG_CONFIG_HOME}/packer"
export PACKER_CACHE_DIR="${XDG_CACHE_HOME}/packer"
export HTTPIE_CONFIG_DIR="${XDG_CONFIG_HOME}/httpie"
export ANSIBLE_LOCAL_TEMP="${XDG_RUNTIME_DIR}/ansible/tmp"
export GOPATH="$XDG_DATA_HOME/go"
export TASKDATA="$XDG_DATA_HOME/task"
export TASKRC="${XDG_CONFIG_HOME}/task/taskrc"
export PERL_CPANM_HOME="${XDG_CACHE_HOME}/cpanm"
export SOLARGRAPH_CACHE="${XDG_CACHE_HOME}/solargraph"
#######################################################################################################################
#  通用
########################################################################################################################
alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias vi='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias w3m="w3m -config $XDG_CONFIG_HOME/w3m/config"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias calcurse="calcurse --confdir $XDG_CONFIG_HOME/calcurse --datadir $XDG_DATA_HOME/calcurse"
eval $(thefuck --alias)
if `command -v gdircolors >/dev/null 2>&1`; then
    #MacOS
    #alias ls='ls --color=auto'
    # 是否输出颜色
    export CLICOLOR='Yes'                      
    # 指定颜色
    export LSCOLORS=bxfxhxhxgxhxhxgxgxbxbx     
    eval "`gdircolors -b $XDG_CONFIG_HOME/shell/dircolors/dircolors.ansi-dark`"
    osascript -e "tell application \"Terminal\" to set the font size of window 0 to 16"
    osascript -e "tell application \"Terminal\" to set the font name of window 0 to \"Droid Sans Mono Nerd Font Complete\""
elif `command -v dircolors >/dev/null 2>&1`; then
    eval "`dircolors -b $XDG_CONFIG_HOME/shell/dircolors/dircolors.ansi-dark`"
fi

if [ -d /Applications/VLC.app/Contents/MacOS ];then
    #在ranger中使用VLC打开视频
    export PATH=$PATH:/Applications/VLC.app/Contents/MacOS/
fi

if [ -f $XDG_CONFIG_HOME/shell/bash_profile ]; then
    source $XDG_CONFIG_HOME/shell/bash_profile
fi

if [ -f $XDG_CONFIG_HOME/shell/inputrc.sh ]; then
    #$include  /etc/inputrc
    #export INPUTRC=$XDG_DATA_HOME/$SHELL_NAME/inputrc
    source $XDG_CONFIG_HOME/shell/inputrc.sh
fi
if [ ! -d $XDG_DATA_HOME/$SHELL_NAME ]; then
    mkdir -pv $XDG_DATA_HOME/$SHELL_NAME
fi
#禁用或者创建SHELL_SESSION_HISTORY=0
#SHELL_SESSION_HISTORY=0
export HISTFILESIZE=400000000
export HISTSIZE=10000
export HISTFILE=$XDG_DATA_HOME/$SHELL_NAME/"$SHELL_NAME"_history
export SHELL_SESSION_DIR=$XDG_DATA_HOME/$SHELL_NAME/${SHELL_NAME}_sessions
########################################################################################################################
#  查询
########################################################################################################################
#单词
function vo() {
  declare q="$*"
  curl --user-agent curl "https://v2en.co/${q// /%20}"
}

function vo-sh() {
    while echo -n "Vocabulary> "
    read -r input
    [ -n "$input" ];do 
        vo "$input"
    done
}
#天气
function we() {
    declare q="$*"
    curl --user-agent curl "http://wttr.in/${q// /%20}"
}

function we-sh() {
    while echo -n "Weather> "
    read -r input
    [ -n "$input" ];do 
        we "$input"
    done
}

function start() {
    $XDG_CONFIG_HOME/shell/tmux-start.sh
}



function co() {
    i=0;
    for j in {1..16}; do
        for k in {1..16}; do
            printf "\e[1;48;05;${i}m %03d \e[0m" $i
            i=$((i+1))
        done
         echo
    done
}

########################################################################################################################
#  mocp
########################################################################################################################
alias moc='jackd -d coreaudio & mocp -C $HOME/.config/moc/config -M $HOME/.config/moc'
########################################################################################################################
#  mail
########################################################################################################################
export FETCHMAILHOME=$XDG_CONFIG_HOME/mutt/accounts
########################################################################################################################
#  newsboat
########################################################################################################################
if [ ! -e "$XDG_CACHE_HOME/newsboat" ];then
    mkdir -p $XDG_CACHE_HOME/newsboat
fi
########################################################################################################################
#  数据库
########################################################################################################################
alias mycli='mkdir -p $XDG_DATA_HOME/mycli;touch $XDG_DATA_HOME/mycli/.mycli.log;mycli --myclirc $XDG_CONFIG_HOME/mycli/myclirc'
alias pgcli='pgcli --pgclirc $XDG_CONFIG_HOME/pgcli/pgclirc'
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql/mysql_history
mkdir -p $XDG_DATA_HOME/mysql
########################################################################################################################
#  ssh
########################################################################################################################
export BASHLIB=/Volumes/Work/source/IntelliJ/Bash
alias ssh="cd $BASHLIB;ssh -F $BASHLIB/src/security/ssh/.ssh/config"
alias scp="cd $BASHLIB;scp -F $BASHLIB/src/security/ssh/.ssh/config"
alias ssh-copy-id="cd $BASHLIB;ssh-copy-id -C $BASHLIB/src/security/ssh/.ssh/config"
########################################################################################################################
#  Ruby
########################################################################################################################
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
#
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"
export GEMRC="${XDG_CONFIG_HOME}/gem/gemrc"
export rvm_path=$XDG_CACHE_HOME/rvm
########################################################################################################################
# NPM 
########################################################################################################################
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm
export NPM_CONFIG_TMP=$XDG_RUNTIME_DIR/npm
########################################################################################################################
# FZF 
########################################################################################################################
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
source $XDG_CONFIG_HOME/fzf/fzf.$SHELL_NAME

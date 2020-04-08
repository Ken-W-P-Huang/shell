export SHELL_NAME=zsh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
########################################################################################################################
#  zsh
########################################################################################################################
#不可以更改！
export ZSH=$XDG_CACHE_HOME/$SHELL_NAME/oh-my-zsh
export OH_MY_ZSH_DIR=$ZSH
ZSH_THEME="prompt" #"agnoster"
#zsh配置文件目录
#export ZDOTDIR=$XDG_CACHE_HOME/$SHELL_NAME
export ZSH_COMPDUMP=$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
if [ ! -d $OH_MY_ZSH_DIR ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git $OH_MY_ZSH_DIR
fi
source $OH_MY_ZSH_DIR/oh-my-zsh.sh
plugins=(git autojump osx mvn gradle ansible brew docker xcode vi-mode vim-interaction tmux spring sudo)
alias -s html=mate   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=mate     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s py=vi       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
#在这里inputrc才不会被覆盖
source $XDG_CONFIG_HOME/shell/common.sh



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

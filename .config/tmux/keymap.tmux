########################################################################################################################
#  通用
########################################################################################################################
#设置功能键和普通键响应的时间间隔
set -sg escape-time 1
########################################################################################################################
# 鼠标
########################################################################################################################
set -g mouse off
########################################################################################################################
# 按键
########################################################################################################################
# 将功能键从C-b设置为C-x
set -g prefix C-x
unbind C-b
# 让其他应用也可以响应Ctrl-A(第一下是tmux，第二下是应用)
bind C-a send-prefix
# pane 移动 调整Pane大小
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
#bind 1 select-pane -t 1
#bind 2 select-pane -t 2
#bind 3 select-pane -t 3
#bind 4 select-pane -t 4
#bind 5 select-pane -t 5
#bind 6 select-pane -t 6
#bind 7 select-pane -t 7
#bind 8 select-pane -t 8
#bind 9 select-pane -t 9
# window
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+
bind 1 select-window -t 1
bind 2 select-window -t 2
bind 3 select-window -t 3
bind 4 select-window -t 4
bind 5 select-window -t 5
bind 6 select-window -t 6
bind 7 select-window -t 7
bind 8 select-window -t 8
bind 9 select-window -t 9
#切屏
bind v split-window -h
bind s split-window -v
#session
bind-key S list-sessions  
#最大化当前窗口
bind ^z run "tmux-zoom"
#重载配置文件
bind r source-file $XDG_CONFIG_HOME/tmux/tmux.conf \; display "Configuration file is reloaded!"
########################################################################################################################
# 插件
########################################################################################################################
#tmux-yank
#set -g @yank_action 'copy-pipe'
#set -g @yank_with_mouse off
#set -g @shell_mode 'vi'
#tmux-open 
#set -g @open 'x'
#set -g @open-editor 'C-x'
#set -g @open-B 'https://www.bing.com/search?q='

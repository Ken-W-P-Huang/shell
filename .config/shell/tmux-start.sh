#!/usr/bin/env zsh
tmux=$(which tmux)
if [ -z $tmux ]; then
  echo "Please install tmux before using this script."
  exit 1
fi
source ~/.zshrc
sessionName=Work
if  tmux has -t $sessionName; then
    tmux attach -t $sessionName
else
    tmux  new -d -s $sessionName
    if `type musicbox >/dev/null 2>&1 `; then
        tmux neww musicbox
    fi
    if `type mutt >/dev/null 2>&1 `; then
        tmux neww mutt
    fi
    interval=0.3
    if `type vifm >/dev/null 2>&1 `; then
        tmux neww vifm
        tmux send-keys  ':tabnew'
        sleep $interval
        tmux send-keys  C-m
        sleep $interval
        tmux send-keys  ':tabnew'
        sleep $interval
        tmux send-keys  C-m
    fi
    if `type vim >/dev/null 2>&1 `; then
        tmux neww vim
        tmux renamew Man
        tmux send-keys  C-m
        tmux send-keys  "e"
        tmux neww vim
        tmux send-keys  C-m
        tmux send-keys  "e"
    fi
    tmux kill-window -t 1
    tmux neww $SHELL
    tmux attach -t $sessionName
fi

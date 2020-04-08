# Begin /etc/inputrc
set page-completions on
set completion-ignore-case on
set completion-query-items 200
set show-all-if-ambiguous on
set show-all-if-unmodified on
set visible-stats on
# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none
#set editing-mode vi
#export EDITOR=vi
#set keymap vi-command
#set keymap vi-insert
set -o vi
return
if [[ $SHELL_NAME == 'zsh' ]]; then
    # All of the following map the escape sequence of the value
    # contained in the 1st argument to the readline specific functions
    bindkey "\eOd" backward-word
    bindkey "\eOc" forward-word

    # for linux console
    bindkey "\e[1~" beginning-of-line
    bindkey "\e[4~" end-of-line
    bindkey "\e[5~" beginning-of-history
    bindkey "\e[6~" end-of-history
    bindkey "\e[3~" delete-char
    bindkey "\e[2~" quoted-insert

    # for xterm
    bindkey "\eOH" beginning-of-line
    bindkey "\eOF" end-of-line

    # for Konsole
    bindkey "\e[H" beginning-of-line
    bindkey "\e[F" end-of-line
else
   return
    # All of the following map the escape sequence of the value
    # contained in the 1st argument to the readline specific functions
    #"\eOd": backward-word
    #"\eOc": forward-word

    # for linux console
    #"\e[1~": beginning-of-line
    #"\e[4~": end-of-line
    #"\e[5~": beginning-of-history
    #"\e[6~": end-of-history
    #"\e[3~": delete-char
    #"\e[2~": quoted-insert

    # for xterm
    #"\eOH": beginning-of-line
    #"\eOF": end-of-line

    # for Konsole
    #"\e[H": beginning-of-line
    #"\e[F": end-of-line
fi
# End /etc/inputrc

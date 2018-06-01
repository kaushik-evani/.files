#!/bin/bash

# setting a case-insensitivity shell option
shopt -s nocasematch
echo "+_+ | --- Starting Adminer --- |"
list_of_tmuxes=$(tmux ls)
re=".*adminer.*windows.*"
if [[ $list_of_tmuxes =~ $re ]]; then
    echo "+_+ There are old adminers still tmuxing."
    echo "+_+ Killing all old adminers"
    $(tmux list-sessions | awk 'BEGIN{FS=":"}{print $1}' | grep adminer | xargs -n 1 tmux kill-session -t)
    echo "+_+ Respawning new adminer"
fi

echo "+_+ Respawning new adminer"
$(tmux new -s adminer -d)
is_password_prompt=$(tmux send-keys -t 'adminer' 'sudo su - postgres' c-m)
echo $is_password_prompt
# $(tmux send-keys - 'adminer' '')

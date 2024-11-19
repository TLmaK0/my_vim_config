setw -g mode-keys vi
set -g status-keys vi 
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
set -g history-limit 10000

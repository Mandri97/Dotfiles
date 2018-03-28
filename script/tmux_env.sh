#!/bin/sh

# Customization tmux Environments
	 
SESS=Main

Main(){
    tmux new-session -s $SESS -n Terminal -d
    tmux new-window -n Music
    tmux send-keys -t $SESS:2 'ncmpcpp play; ncmpcpp' C-m 
    tmux select-window -t $SESS:1
}

python(){
    tmux new-session -s $SESS -n Code -d
    tmux send-keys -t $SESS 'cd $HOME/Code/python' C-m
    tmux split-window -h -t $SESS
    tmux send-keys -t $SESS 'cd $HOME/Code/python' C-m
    tmux send-keys -t $SESS:1.1 'vim .' C-m
    tmux send-keys -t $SESS "ipython" C-m
}

cpp(){
    tmux new-session -s $SESS -n Code -d
    tmux send-keys -t $SESS 'cd $HOME/Code/C++' C-m
    tmux split-window -h -t $SESS
    tmux send-keys -t $SESS 'cd $HOME/Code/C++' C-m
    tmux send-keys -t $SESS:1.1 'vim .' C-m
}

case "$1" in 
    Main|main)
	$(Main);;
    Python|python)
	SESS=Python
	$(python);;
    c|cpp|c)
	SESS=cpp
	$(cpp);;
    *)
	$(Main);;
esac

tmux select-pane -t $SESS:1.1
tmux attach -t $SESS

#/bin/sh
tmux new -d -s kube-ds
tmux select-window -t kube-ds:0
pods=$(kubectl --namespace=$1 get pods | grep $2  | awk {'print $1'})
for pod in $pods
do tmux split-window -h kubectl --namespace=$1 logs $pod -f
done
tmux select-layout even-horizontal
tmux -2 attach-session -t kube-ds

function start-ssh-agent() {
    if [[ -f ~/.ssh-agent-info ]]
    then
        source ~/.ssh-agent-info
    fi

    ssh-add -l >&/dev/null

    if [[ $? -eq 2 ]]
    then
        echo "ssh-agent: restart...."
        ssh-agent > ~/.ssh-agent-info
        source ~/.ssh-agent-info
    fi

    if ssh-add -l >&/dev/null
    then
        echo "ssh-agent: Identity is already stored."
    else
        keys=(${HOME}/.ssh/*_rsa)
        for file in ${keys}
        do
            ssh-add ${file} 2>&1 > /dev/null
        done
    fi

    ssh-add -l
}

function kill-ssh-agent() {
    pgrep ssh-agent 2>&1 > /dev/null
    if [[ $? -eq 0 ]]
    then
        pkill ssh-agent
        echo 'ssh-agent: killed.'
    else
        echo 'ssh-agent: no process.'
    fi

    if [[ -f ~/.ssh-agent-info ]]
    then
        rm ~/.ssh-agent-info
    fi
}

agent=${HOME}/.ssh/auth_sock
if [ ! -L "${SSH_AUTH_SOCK}" ] && [ "${USER}" != "vagrant" ]
then
    ln -snf "${SSH_AUTH_SOCK}" $agent
fi
export SSH_AUTH_SOCK=${agent}

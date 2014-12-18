if [ -f ${HOME}/.anyenv/bin/anyenv ]
then
    export PATH="${HOME}/.anyenv/bin:${PATH}"
    eval "$(anyenv init -)"
fi


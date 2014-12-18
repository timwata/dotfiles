if [ -f ${HOME}/.anyenv/bin/anyenv ]
then
    export PATH="${HOME}/.anyenv/bin:${PATH}"
    eval "$(anyenv init -)"
fi

function install-rbenv() {
    anyenv install rbenv
    reload
}

function install-plenv() {
    anyenv install plenv
    reload
}

function install-pyenv() {
    anyenv install pyenv
    reload
}

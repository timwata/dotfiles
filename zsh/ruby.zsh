if [[ ! -d ${HOME}/.rbenv ]]
then
    git clone https://github.com/sstephenson/rbenv.git      ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
eval "$(rbenv init -)"

function _set_alias {
    local als=$1
    local cmd=$2
    local opt=$3
  
    type ${cmd} > /dev/null 2>&1
    if [ $? -eq 0 ]
    then
        alias ${als}="${cmd} ${opt}"
    else
        echo "[WARN] failed 'alias ${als}=${cmd} ${opt}'"
    fi
}

# reload shell settings
_set_alias "reload" "exec" "${SHELL} -l"
_set_alias "ll" "ls" "-l"
_set_alias "sc" "screen" "-U"
_set_alias "ssh" "ssh" "-A"

case ${OSTYPE} in
    darwin*)
        coreutils_dir=$(brew --prefix coreutils)/libexec/gnubin
        _set_alias "dircolors" "${coreutils_dir}/dircolors"
        _set_alias "ls" "${coreutils_dir}/ls" "--color=auto"
        ;;
    linux*)
        _set_alias "ls" "ls" "--color=auto"
        ;;
esac


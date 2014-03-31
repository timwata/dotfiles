function _set_alias {
    local als=$1
    local cmd=$2
    local opt=$3
  
    type ${cmd} > /dev/null 2>&1
    if [ $? -eq 0 ]
    then
        alias ${als}="${cmd} ${opt}"
    fi
}

# reload shell settings
_set_alias "reload" "exec" "${SHELL} -l"

case ${OSTYPE} in
    darwin*)
        _set_alias "dircolors" "gdircolors"
        _set_alias "ls" "gls" "--color=auto"
        ;;
    linux*)
        _set_alias "ls" "ls" "--color=auto"
        ;;
esac


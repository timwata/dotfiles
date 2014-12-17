case ${OSTYPE} in
    darwin*)
        ;;
    linux*)
        ;;
esac

function peco_select_history() {
    local tac
    if which tac > /dev/null; then
      tac="tac"
    else
      tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}

zle -N peco_select_history

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

function peco_select_screen() {
    local selected_session="$(screen -ls | \
        awk 'NR==1,/^There (is a|are) screens? on:/ { next } /^[0-9]+ Sockets? in/ { exit } 1' | \
        while read session state; do echo "${(r:30:::::)session} ${state}"; done | peco)"
    BUFFER="screen -rx $(echo ${selected_session} | cut -d ' ' -f1)"
    zle clear-screen
    zle accept-line
}

zle -N peco_select_screen

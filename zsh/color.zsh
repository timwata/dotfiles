#eval $(dircolors ${ZSH}/dircolors-solarized/dircolors.256dark)
eval $(dircolors ${ZSH}/LS_COLORS/LS_COLORS)

DEFAULT=$'%{\e[m%}'
ORANGE=$'%{\e[38;5;172m%}'
LIGHT_ORANGE=$'%{\e[38;5;215m%}'
PINK=$'%{\e[38;5;205m%}'
RED_VIVID=$'%{\e[38;5;196m%}'
LIGHT_GREEN=$'%{\e[38;5;47m%}'
MAGENDA=$'%{\e[38;5;213m%}'
MOS_BLUE=$'%{\e[38;5;117m%}'
MOS_ORANGE=$'%{\e[38;5;215m%}'
MOS_GREEN=$'%{\e[38;5;71m%}'
MOS_PINK=$'%{\e[38;5;211m%}'
LIGHT_BLUE=$'%{\e[38;5;45m%}'
YELLOWGREEN=$'%{\e[38;5;120m%}'


# for check if 256 color is enabled
function pcolor() {
  for ((f = 0; f < 255; f++)); do
    printf "\e[38;5;%dm %3d#\e[m" $f $f
    if [[ $f%8 -eq 7 ]] then
      printf "\n"
    fi
 done
 echo
}


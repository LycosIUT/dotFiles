#Color MACRO
RED="\[$(tput setaf 2)\]"
GRAY="\[$(tput setaf 6)\]"
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"

#PS
PS1="\u ${GRAY}[\w]${RESET}\$ "

#====== COLORS ==========
RED="\[$(tput setaf 2)\]"
GRAY="\[$(tput setaf 6)\]"
BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"
#========================

#====== GIT ==============================================================
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/{\1} /'
}
#=========================================================================

#====== PS1 ========================================================
export PS1="${GRAY}╭${RED}\$(parse_git_branch)${RESET}${GRAY}[\w]\$ \n╰●${RESET} "
#===================================================================

#=========== Aliases Management =============
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases;
fi
#============================================

#================Compressed Files =====================================
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

function maketar() { tar cvzf "${1%%/}.tar.gz" "${1%%/}/"; }
function makezip() { zip -r "${1%%/}.zip" "$1" ;}

#complete -f -o default -X '!*.(zip|ZIP|z|Z|gz|GZ|bz2|BZ2)' extract
#===========================================================================

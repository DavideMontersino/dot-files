### PS1 SETTINGS =======================================================

# show more git info in PS1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

# colors
export PS1_GREY="\[$(tput bold; tput setaf 0)\]"
export PS1_GREEN="\[$(tput bold; tput setaf 2)\]"
export PS1_YELLOW="\[$(tput bold; tput setaf 3)\]"
export PS1_MAGENTA="\[$(tput bold; tput setaf 5)\]"
export PS1_CYAN="\[$(tput bold; tput setaf 6)\]"
export PS1_WHITE="\[$(tput bold; tput setaf 7)\]"
export PS1_RESET="\[$(tput sgr0)\]"

# function to set PS1
function _bash_prompt(){
    # git info
    local GIT_INFO=$(git branch &>/dev/null && echo "${PS1_CYAN}git${PS1_WHITE}:$(__git_ps1 '%s')")

    # add <esc>k<esc>\ to PS1 if screen is running
    # see man(1) screen, section TITLES for more
    if [[ "$TERM" == screen* ]]; then
        local SCREEN_ESC='\[\ek\e\\\]'
    else
        local SCREEN_ESC=''
    fi

    # finally, set PS1
    PS1="\n${PS1_MAGENTA}\u ${PS1_GREY}at${PS1_YELLOW} \h ${PS1_GREY}in${PS1_GREEN} \w ${GIT_INFO}\
        \n${SCREEN_ESC}${PS1_WHITE}\$${PS1_RESET} "
}

# call _bash_prompt() each time the prompt is refreshed
export PROMPT_COMMAND=_bash_prompt


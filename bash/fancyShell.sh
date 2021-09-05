#!/bin/bash

__powerline()
{
    # Unicode symbols
    readonly GIT_BRANCH_CHANGED_SYMBOL='+'
    readonly GIT_NEED_PULL_SYMBOL='⇣'
    readonly GIT_NEED_PUSH_SYMBOL='⇡'
    readonly PS_SYMBOL='🐧'

    # Solarized colorscheme
    readonly BG_BASE00="\\[$(tput setab 11)\\]"
    readonly BG_BASE01="\\[$(tput setab 10)\\]"
    readonly BG_BASE02="\\[$(tput setab 0)\\]"
    readonly BG_BASE03="\\[$(tput setab 8)\\]"
    readonly BG_BASE0="\\[$(tput setab 12)\\]"
    readonly BG_BASE1="\\[$(tput setab 14)\\]"
    readonly BG_BASE2="\\[$(tput setab 7)\\]"
    readonly BG_BASE3="\\[$(tput setab 15)\\]"
    readonly BG_BLUE="\\[$(tput setab 4)\\]"
    readonly BG_COLOR1="\\[\\e[48;5;240m\\]"
    readonly BG_COLOR2="\\[\\e[48;5;238m\\]"
    readonly BG_COLOR3="\\[\\e[48;5;238m\\]"
    readonly BG_COLOR4="\\[\\e[48;5;31m\\]"
    readonly BG_COLOR5="\\[\\e[48;5;31m\\]"
    readonly BG_COLOR6="\\[\\e[48;5;237m\\]"
    readonly BG_COLOR7="\\[\\e[48;5;237m\\]"
    readonly BG_COLOR8="\\[\\e[48;5;161m\\]"
    readonly BG_COLOR9="\\[\\e[48;5;161m\\]"
    readonly BG_CYAN="\\[$(tput setab 6)\\]"
    readonly BG_GREEN="\\[$(tput setab 2)\\]"
    readonly BG_MAGENTA="\\[$(tput setab 5)\\]"
    readonly BG_ORANGE="\\[$(tput setab 9)\\]"
    readonly BG_RED="\\[$(tput setab 1)\\]"
    readonly BG_VIOLET="\\[$(tput setab 13)\\]"
    readonly BG_YELLOW="\\[$(tput setab 3)\\]"
    readonly BOLD="\\[$(tput bold)\\]"
    readonly DIM="\\[$(tput dim)\\]"
    readonly FG_BASE00="\\[$(tput setaf 11)\\]"
    readonly FG_BASE01="\\[$(tput setaf 10)\\]"
    readonly FG_BASE02="\\[$(tput setaf 0)\\]"
    readonly FG_BASE03="\\[$(tput setaf 8)\\]"
    readonly FG_BASE0="\\[$(tput setaf 12)\\]"
    readonly FG_BASE1="\\[$(tput setaf 14)\\]"
    readonly FG_BASE2="\\[$(tput setaf 7)\\]"
    readonly FG_BASE3="\\[$(tput setaf 15)\\]"
    readonly FG_BLUE="\\[$(tput setaf 4)\\]"
    readonly FG_COLOR1="\\[\\e[38;5;250m\\]"
    readonly FG_COLOR2="\\[\\e[38;5;240m\\]"
    readonly FG_COLOR3="\\[\\e[38;5;250m\\]"
    readonly FG_COLOR4="\\[\\e[38;5;238m\\]"
    readonly FG_COLOR6="\\[\\e[38;5;31m\\]"
    readonly FG_COLOR7="\\[\\e[38;5;250m\\]"
    readonly FG_COLOR8="\\[\\e[38;5;237m\\]"
    readonly FG_COLOR9="\\[\\e[38;5;161m\\]"
    readonly FG_CYAN="\\[$(tput setaf 6)\\]"
    readonly FG_GREEN="\\[$(tput setaf 2)\\]"
    readonly FG_MAGENTA="\\[$(tput setaf 5)\\]"
    readonly FG_ORANGE="\\[$(tput setaf 9)\\]"
    readonly FG_RED="\\[$(tput setaf 1)\\]"
    readonly FG_VIOLET="\\[$(tput setaf 13)\\]"
    readonly FG_YELLOW="\\[$(tput setaf 3)\\]"
    readonly RESET="\\[$(tput sgr0)\\]"
    readonly REVERSE="\\[$(tput rev)\\]"

    __directory_info()
    {
	printf "$FG_COLOR1"

	dir=$(pwd)

	if [[ "$dir" == "$HOME" ]] 
	then
	    dir=" "
	else
	    dir="\w"
	fi

	printf "$BG_COLOR5$dir$FG_COLOR6"
    }

    __git_info()
    {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != "true" ]]
	then
	    return
	fi

	printf "$BG_BASE0$(git branch --show-current)"
    }

    ps1_shell()
    {
	PS1="$RESET$FG_COLOR1$BG_COLOR5"
	PS1+="$(__directory_info)"
	PS1+="$(__git_info $BG_GREEN)"
	PS1+="$RESET "
    }

PROMPT_COMMAND=ps1_shell

}

__powerline
unset __powerline

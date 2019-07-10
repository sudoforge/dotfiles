#!/usr/bin/env zsh

__current_dir() {
    code_dir="${HOME}/code/src"
    pwd | sed -E \
        -e 's;^'"${code_dir}"'/github.com/(.+);gh::\1;' \
        -e 's;^'"${code_dir}"'/bitbucket.org/(.+);bb::\1;' \
        -e 's;^'"${code_dir}"'/aur.archlinux.org/(.+);aur::\1;' \
        -e 's;^'"${code_dir}"'/github.platforms.engineering/(.+);baygit::\1;' \
        -e 's;^'"${HOME}"';\~;'
}

__git_prompt_status() {
    # exit if not in a git repository
    if  ! command which git &> /dev/null ||
        ! command git rev-parse --git-dir &> /dev/null;
    then return; fi

    FULLINDEX=$(command git status 2> /dev/null) 
    ref_color="030"

    if echo "${FULLINDEX}" | grep '^Your branch.*behind' &> /dev/null; then
        ref_color="203"
    fi
    if echo "${FULLINDEX}" | grep '^Your branch.*ahead' &> /dev/null; then
        ref_color="035"
    fi
    if echo "${FULLINDEX}" | grep '^Your branch.*diverged' &> /dev/null; then
        ref_color="160"
    fi
    if echo "${FULLINDEX}" | grep '.*detached at.*' &> /dev/null; then
        ref_color="215"
    fi

    # status
    ref=$(git symbolic-ref HEAD 2> /dev/null ||\
          git rev-parse --short HEAD 2> /dev/null) || return
    ref=$(echo "$ref" | sed 's/refs\/[a-z]\{1,\}\///')
    INDEX=$(command git status --porcelain -b 2> /dev/null)
    STATUS=""
    INDEXED=""
    WORKING=""
    shelf=""

    # index counters
    count_added=$(echo "$INDEX" | grep -c '^A')
    count_modified=$(echo "$INDEX" | grep -c -E '^[MR]')
    count_deleted=$(echo "$INDEX" | grep -c '^D')
    count_conflict=$(echo "$INDEX" | grep -c '^U')

    # working tree counters
    count_untracked=$(echo "$INDEX" | grep -c -E '^[\?A][\?A] ')
    count_modified_=$(echo "$INDEX" | grep -c -E '^[A-Z ][MR] ')
    count_deleted_=$(echo "$INDEX" | grep -c -E '^[A-Z ]D ')
    count_conflict_=$(echo "$INDEX" | grep -c '^[A-Z ]U ')

    # index
    if $(echo "$INDEX" | grep '^A' &> /dev/null) || $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
        INDEXED=" +$count_added"
    fi
    if $(echo "$INDEX" | grep '^[MR]' &> /dev/null); then
        INDEXED="$INDEXED ~$count_modified"
    fi
    if $(echo "$INDEX" | grep '^D' &> /dev/null); then
        INDEXED="$INDEXED -$count_deleted"
    fi
    if $(echo "$INDEX" | grep '^U' &> /dev/null); then
        INDEXED="$INDEXED !$count_conflict"
    fi

    # working directory
    if $(echo "$INDEX" | grep -E '^[\?A][\?A] ' &> /dev/null); then
        WORKING=" +$count_untracked"
    fi
    if $(echo "$INDEX" | grep -E '^[A-Z ][MR] ' &> /dev/null); then
        WORKING="$WORKING ~$count_modified_"
    fi
    if $(echo "$INDEX" | grep -E '^[A-Z ]D ' &> /dev/null); then
        WORKING="$WORKING -$count_deleted_"
    fi
    if $(echo "$INDEX" | grep '^[A-Z ]U ' &> /dev/null); then
        WORKING="$WORKING !$count_conflict_"
    fi

    if [[ $count_untracked > 0 ]]; then
        WORKING="$WORKING !"
    fi

    if [[ $INDEXED != "" ]]; then
        INDEXED="$FG[035]${INDEXED}$FX[reset]"
    fi

    if [[ $WORKING != "" ]]; then
        WORKING="$FG[001]${WORKING}$FX[reset]"
    fi

    if [[ $INDEXED != "" && $WORKING != "" ]]; then
        STATUS="${INDEXED} |${WORKING}"
    else
        STATUS="${INDEXED}${WORKING}"
    fi

    if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
        STATUS="${STATUS} $FG[215]*$FX[reset]"
    fi

    if [[ $(git config --local --get branch.$ref.shelf) == "true" ]]; then
        shelf="$FG[245](shelf)$FX[reset] "
    fi

    echo "[ ${shelf}$FG[$ref_color]${ref}$FX[reset]${STATUS} ]"
}


# Prompt character
PROMPT_CHAR="→"

# Left prompt
PROMPT="\$(__current_dir) \$(__git_prompt_status)"
PROMPT="${PROMPT}"$'\n'"%(?..%{$FX[reset]$FG[203]%})$FX[bold]${PROMPT_CHAR}$FX[no-bold]$FX[reset] "

unset PROMPT_CHAR
unset __current_dir
unset __git_prompt_status
unset newline

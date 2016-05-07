if is_shell zsh && [[ "${ZSH_THEME}" == "powerlevel9k/powerlevel9k" ]]; then
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir rbenv vcs background_jobs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

    if in_array vi-mode "${plugins[@]}"; then
        POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=(vi_mode)
    fi

    # Awesome fonts! (literally)
    POWERLEVEL9K_MODE='awesome-fontconfig'

    POWERLEVEL9K_HOME_ICON=''
    POWERLEVEL9K_HOME_SUB_ICON=''
    POWERLEVEL9K_FOLDER_ICON=''

    # pwd truncation
    #POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
    #POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    #POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

    # Prompt on newline
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
fi

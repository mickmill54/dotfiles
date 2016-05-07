if is_shell zsh; then
    # Do not share history
    setopt NO_SHARE_HISTORY

    # Save the time and duration
    setopt EXTENDED_HISTORY
fi

if is_shell zsh; then
    setopt nohashdirs
    setopt nohashcmds
    zstyle ":completion:*:commands" rehash 1
fi

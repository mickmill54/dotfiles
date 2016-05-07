if is_shell zsh && in_array vi-mode "${plugins[@]}"; then
    export KEYTIMEOUT=1

    bindkey '^r' history-incremental-search-backward
fi

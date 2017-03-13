if ! is_os macOS && command -v keychain &>/dev/null; then
    eval $(keychain -q --eval)
fi

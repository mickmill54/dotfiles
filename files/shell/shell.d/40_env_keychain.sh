if which keychain &>/dev/null; then
    eval $(keychain -q --eval id_rsa)
    eval $(keychain -q --eval id_ed25519)
fi

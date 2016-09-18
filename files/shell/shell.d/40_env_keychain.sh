if which keychain &>/dev/null && [[ "${KDE_FULL_SESSION}" == true ]]; then
    eval $(keychain -q --eval id_rsa)
fi

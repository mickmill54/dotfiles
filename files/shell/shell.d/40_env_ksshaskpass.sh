if is_distro Arch && [[ "${KDE_FULL_SESSION}" == true ]]; then
    if ksshaskpass=$(command -v ksshaskpass); then
        export SSH_ASKPASS=${ksshaskpass}
    fi
fi

if is_os Linux; then
    if [[ -z "${__distro}" ]]; then
        if [ -f /etc/fedora-release ]; then
            __distro=Fedora
        elif [ -f /etc/arch-release ]; then
            __distro=Arch
        elif [ -f /etc/SuSE-release ]; then
            __distro=openSUSE
        elif [ -f /etc/debian_version ]; then
            __distro=Debian
        elif [ -f /etc/ubuntu_version ]; then
            __distro=Ubuntu
        else
            __distro=Unknown
        fi
    fi
fi

is_distro() {
    if ! is_os Linux; then
        return 1
    fi

    local i
    for i in "${@}"; do
        if [[ "${__distro}" == "${i}" ]]; then
            return 0
        fi
    done
    return 1
}

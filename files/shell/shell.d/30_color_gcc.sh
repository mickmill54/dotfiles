if which color-gcc &>/dev/null; then
    if is_distro Debian; then
        path_push_front "/usr/lib/ccache"
    elif is_distro Arch; then
        path_push_front "/usr/lib/colorgcc/bin"
        export CCACHE_PATH="/usr/bin"
    fi
fi

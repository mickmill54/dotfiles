if is_distro Arch; then
    path_push_front /usr/lib/ccache/bin
fi

export CCACHE_DIR=/stuff/ccache
export CCACHE_NLEVELS=4

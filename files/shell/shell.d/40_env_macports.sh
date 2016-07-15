if is_os macOS && [[ -d /opt/local ]]; then
    path_push_front /opt/local/sbin
    path_push_front /opt/local/bin
    export MANPATH="/opt/local/share/man:${MANPATH}"
fi

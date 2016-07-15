paths=(
    /usr/lib/ccache/bin
    /usr/local/opt/ccache/libexec
)

for p in "${paths[@]}"; do
    if [[ -d "${p}" ]]; then
        path_push_front "${p}"
    fi
done

unset p

if [[ -d /stuff/ccache ]]; then
    export CCACHE_DIR=/stuff/ccache
fi

export CCACHE_NLEVELS=4

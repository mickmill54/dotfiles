if is_os macOS && [[ -d /usr/local/mysql ]]; then
    path_push_back /usr/local/mysql/bin
    export DYLD_LIBRARY_PATH="${DYLD_LIBRARY_PATH}:/usr/local/mysql/lib"
fi

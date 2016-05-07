if is_distro Arch; then

setpy2() {
    echo "WARNING: This command adds a writable directory to the front of \$PATH"
    sleep 2
    local TEMP
    TEMP=$(mktemp -d)
    ln -s /usr/bin/python2 "${TEMP}/python"
    PATH=${TEMP}:${PATH} "${@}"
    EXIT=${?}
    rm "${TEMP}/python"
    rmdir "${TEMP}"
    return ${EXIT}
}

fi

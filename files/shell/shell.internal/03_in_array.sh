in_array() {
    local needle=${1}
    shift
    local item
    for item in "${@}"; do
        if [[ ${item} = "${needle}" ]]; then
            return 0
        fi
    done
    return 1
}

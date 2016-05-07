paths_same() {
    local path1="${1}"
    local path2="${2}"
    local stat1
    local stat2
    stat1=$(stat -c '%d,%i' "${path1}" 2>/dev/null) || return 1
    stat2=$(stat -c '%d,%i' "${path2}" 2>/dev/null) || return 1
    [[ "${stat1}" == "${stat2}" ]]
}

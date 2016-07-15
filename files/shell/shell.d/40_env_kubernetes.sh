if which kubectl &>/dev/null; then
    alias k='kubectl'

    function kns() {
        local namespace="${1}"
        shift
        kubectl --namespace="${namespace}" "${@}"
    }
fi

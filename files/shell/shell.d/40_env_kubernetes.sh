if which kubectl &>/dev/null; then
    alias k='kubectl'

    function kns() {
        local config
        local namespace

        if [[ "${1}" == */* ]]; then
            config=${1%%/*}
            namespace=${1#*/}
        else
            config=${1}
            namespace=default
        fi

        shift
        kubectl --kubeconfig="${HOME}/.kube/config.${config}" --namespace="${namespace}" "${@}"
    }
fi

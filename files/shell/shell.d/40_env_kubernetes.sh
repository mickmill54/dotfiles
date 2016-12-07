if which kubectl &>/dev/null; then
    alias k='kubectl'

    function kns() {
        local config=
        local namespace=
        local configfile=

        if [[ "${1}" == */* ]]; then
            config=${1%%/*}
            namespace=${1#*/}
        else
            namespace=${1}
        fi

        if [[ -z "${config}" ]]; then
            configfile=config
        else
            configfile=config.${config}
        fi

        if [[ -z "${namespace}" ]]; then
            namespace=default
        fi

        shift
        kubectl --kubeconfig="${HOME}/.kube/${configfile}" --namespace="${namespace}" "${@}"
    }
fi

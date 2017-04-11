if which kubectl &>/dev/null; then
    alias k='kubectl'

    function kns_usage() {
        cat << EOF
Usage: kns <pattern> [<kubectl arg> ...]

The <pattern> argument must be provided and takes the following forms:

* <config>
  Use kubeconfig ~/.kube/config.<config> and default namespace
* <config>/<namespace>
  Use kubeconfig ~/.kube/config.<config> and namespace <namespace>
* <config>/
  Use kubeconfig ~/.kube/config.<config> and default namespace
* /<namespace>
  Use default kubeconfig and namespace <namespace>
* /
  Use default kubeconfig and default namespace

Examples:
* kns pd/jenkins ...
  Use kubeconfig ~/.kube/config.pd and namespace 'jenkins'
* kns pd ...
  Use kubeconfig ~/.kube/config.pd and default namespace
* kns /production
  Use default kubeconfig and namespace 'production'
EOF
    }

    function kns() {
        local config=
        local namespace=
        local kubeconfig=

        if [[ "${1}" == -* ]]; then
            kns_usage >&2
            return 1
        fi

        if [[ "${1}" == */* ]]; then
            config=${1%%/*}
            namespace=${1#*/}
        else
            config=${1}
        fi

        if [[ -z "${config}" ]]; then
            kubeconfig=${HOME}/.kube/config
        else
            kubeconfig=${HOME}/.kube/config.${config}
        fi

        if [[ ! -f "${kubeconfig}" ]]; then
            echo "${kubeconfig} does not exist" >&1
            return 1
        fi

        if [[ -z "${namespace}" ]]; then
            namespace=default
        fi

        shift
        kubectl --kubeconfig="${kubeconfig}" --namespace="${namespace}" "${@}"
    }
fi

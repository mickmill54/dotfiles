# Written by: Andrew Gunnerson <andrewgunnerson@gmail.com>

__config_current_shell=
__config_script_dir=

detect_shell() {
    case $(basename -- "$(ps hp $$ | awk '{print $NF}')") in
    -bash|bash)
        __config_current_shell="bash"
        ;;
    -zsh|zsh)
        __config_current_shell="zsh"
        ;;
    *)
        echo "Unknown shell!"
        return 1
        ;;
    esac
}

is_shell() {
    [ "x${__config_current_shell}" = "x${1}" ]
}

detect_shell

if is_shell bash; then
    __config_script_dir=$(dirname "${BASH_SOURCE[0]}")
elif is_shell zsh; then
    __config_script_dir=$(dirname "${0}")
fi

for i in "${__config_script_dir}"/shell.internal/*.sh; do
    source "${i}"
done
for i in "${__config_script_dir}"/shell.d/*.sh; do
    source "${i}"
done
unset i
unset __config_script_dir

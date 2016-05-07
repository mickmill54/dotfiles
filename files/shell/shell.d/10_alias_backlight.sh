if ! modinfo -n nvidiabl &>/dev/null; then
    return 0
fi

_bl_path=/sys/class/backlight/nvidia_backlight/brightness

getbl() {
    echo "Current brightness: $(<${_bl_path})"
}

setbl() {
    local cur_brightness
    local new_brightness

    cur_brightness=$(<${_bl_path})
    case "${1}" in
    '')
        echo "Resetting brightness..."
        new_brightness=${cur_brightness}
        ;;
    '+')
        echo "Increasing brightness by 8..."
        new_brightness=$((cur_brightness + 8))
        ;;
    '-')
        echo "Decreasing brightness by 8..."
        new_brightness=$((cur_brightness - 8))
        ;;
    *)
        if [[ "${1}" =~ ^[[:digit:]]+$ ]]; then
            echo "Setting brightness to ${1}..."
            new_brightness="${1}"
        else
            echo "Huh??" >&2
            return 1
        fi
        ;;
    esac

    # Change brightness
    echo "${new_brightness}" | sudo tee "${_bl_path}" >/dev/null
    getbl
}

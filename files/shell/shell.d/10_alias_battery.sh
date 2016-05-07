if ! modinfo -n tp_smapi &>/dev/null; then
    return 0
fi

setbatt() {
    local start_charge=80
    local stop_charge=95
    local start_charge_path=/sys/devices/platform/smapi/BAT0/start_charge_thresh
    local stop_charge_path=/sys/devices/platform/smapi/BAT0/stop_charge_thresh

    sudo tee "${start_charge_path}" <<< "${start_charge}"
    sudo tee "${stop_charge_path}" <<< "${stop_charge}"
}

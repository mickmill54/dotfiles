if is_distro Arch; then

if which dircolors &>/dev/null; then
    (test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)") || eval "$(dircolors)"
fi

fi

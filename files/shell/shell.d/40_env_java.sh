if is_distro Fedora; then

jdkoracle() {
    path_push_front "/usr/java/latest/bin"
    path_push_front "/usr/java/latest/jre/bin"
}

fi

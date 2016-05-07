if false; then

netsnd_on() {
    pax11publish -e -S something.home.lan
}

netsnd_off() {
    pax11publish -e -S localhost
}

fi

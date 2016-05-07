hex() {
    python3 -c "print(hex(${1})[2:])"
}

int() {
    python3 -c "print(int('${1}', 0))"
}

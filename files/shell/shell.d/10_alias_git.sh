gdescribe() {
    if [[ $(git tag | wc -l) -gt 0 ]]; then
        git describe --long | sed -E "s/^v//g;s/([^-]*-g)/r\1/;s/-/./g"
    else
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    fi
}

garchive() {
    local name
    name="$(basename "$(pwd)")-$(gdescribe)"

    git archive \
        -o "${name}".tar.gz \
        --prefix="${name}/" \
        --format=tar.gz \
        -9 \
        -v \
        HEAD
}

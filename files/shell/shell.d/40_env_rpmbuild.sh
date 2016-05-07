if is_distro Fedora; then

rpmb_here() {
    rpmbuild \
        --define "_builddir     $(pwd)/rpmbuild/BUILD"     \
        --define "_buildrootdir $(pwd)/rpmbuild/BUILDROOT" \
        --define "_rpmdir       $(pwd)/rpmbuild/RPMS"      \
        --define "_sourcedir    $(pwd)/rpmbuild/SOURCES"   \
        --define "_specdir      $(pwd)/rpmbuild/SPECS"     \
        --define "_srcrpmdir    $(pwd)/rpmbuild/SRPMS"     \
        "${@}"
    return ${?}
}

rpmb_cwd() {
    rpmbuild \
        --define "_builddir     $(pwd)/BUILD"     \
        --define "_buildrootdir $(pwd)/BUILDROOT" \
        --define "_rpmdir       $(pwd)"           \
        --define "_sourcedir    $(pwd)"           \
        --define "_specdir      $(pwd)"           \
        --define "_srcrpmdir    $(pwd)"           \
        "${@}"
  return ${?}
}

dlsrc_here() {
    mkdir -p "$(pwd)/rpmbuild/SOURCES"
    spectool -C "$(pwd)/rpmbuild/SOURCES" -g "${1}"
    return ${?}
}

dlsrc_cwd() {
    spectool -C "$(pwd)" -g "${1}"
    return ${?}
}

fi

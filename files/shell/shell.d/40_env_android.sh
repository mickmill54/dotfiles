export ANDROID_HOME=/opt/android-sdk
export ANDROID_NDK=/opt/android-ndk-r11c
export ANDROID_NDK_HOME="${ANDROID_NDK}"
__build_tools_ver="$(find "${ANDROID_HOME}/build-tools" -mindepth 1 -maxdepth 1 | sort -V | tail -1)"
__build_tools_ver="$(basename "${__build_tools_ver}")"
path_push_back "${ANDROID_HOME}/tools"
path_push_back "${ANDROID_HOME}/platform-tools"
path_push_back "${ANDROID_HOME}/build-tools/${__build_tools_ver}"
path_push_back "${ANDROID_NDK}"
unset __build_tools_ver

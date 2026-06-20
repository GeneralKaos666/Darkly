#!/bin/env bash

# Check for Termux
if [ -d "/data/data/com.termux/files/usr" ]; then
    IS_TERMUX=true
    SUDO=""
    USR_PATH="$PREFIX"
else
    IS_TERMUX=false
    SUDO="sudo"
    USR_PATH="/usr"
fi

SRC_DIR=$(pwd)
BUILD_DIR="$SRC_DIR/build"
CMAKE_OPTS=(
    -B $BUILD_DIR
    -S $SRC_DIR
    -DBUILD_TESTING=OFF
    -Wno-dev
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
)
PROJECT="darkly"
_PROJECT="Darkly"

OLD_PROJECT="lightly"
_OLD_PROJECT="Lightly"

install_deps_termux() {
    echo " *** Checking/Installing dependencies for Termux *** "
    pkg install -y cmake extra-cmake-modules kdecoration kf6-kcoreaddons kf6-kcmutils \
        kf6-kcolorscheme kf6-kconfig kf6-kguiaddons kf6-ki18n kf6-kiconthemes \
        kf6-kwindowsystem kf6-kirigami kf6-frameworkintegration qt6-qtbase \
        qt6-qtdeclarative qt6-qtsvg
}

build_qt6() {
    echo " *** Building with QT6 *** "
    remove_build
    remove_qt6_files
    if cmake "${CMAKE_OPTS[@]}" && \
       cmake --build $BUILD_DIR -j $(nproc) && \
       cd $BUILD_DIR && \
       $SUDO cmake --install .; then
        echo "Installation completed!"
    else
        echo "Installation failed!"
        exit 1
    fi
    cd "$SRC_DIR"
}

remove_build() {
    if [ -d "$SRC_DIR/build" ]; then
        echo "Removing existing build directory"
        $SUDO rm -rf $SRC_DIR/build
    fi

    cd "$SRC_DIR"
}

# if existing
remove_qt6_files() {
    files=(
        "${USR_PATH}/lib/qt6/plugins/styles/${PROJECT}6.so*"
        "${USR_PATH}/share/kstyle/themes/${PROJECT}.themerc"
        "${USR_PATH}/lib/qt6/plugins/kstyle_config/${PROJECT}styleconfig.so*"
        "${USR_PATH}/share/applications/${PROJECT}styleconfig.desktop"
        "${USR_PATH}/bin/${PROJECT}-settings6"
        "${USR_PATH}/share/icons/hicolor/scalable/apps/${PROJECT}-settings.svgz"
        "${USR_PATH}/lib/qt6/plugins/org.kde.kdecoration3/org.kde.${PROJECT}.so*"
        "${USR_PATH}/lib/qt6/plugins/org.kde.kdecoration3.kcm/kcm_${PROJECT}decoration.so*"
        "${USR_PATH}/share/applications/kcm_${PROJECT}decoration.desktop"
        "${USR_PATH}/lib/cmake/${PROJECT}/${PROJECT}Config.cmake"
        "${USR_PATH}/lib/cmake/${PROJECT}/${PROJECT}ConfigVersion.cmake"
        "${USR_PATH}/share/color-schemes/${_PROJECT}.colors"
        "${USR_PATH}/lib/cmake/${PROJECT^}"
        "${USR_PATH}/share/kservices6/${PROJECT}decorationconfig.desktop"
    )

    for f in ${files[@]}; do
        $SUDO rm -rf "$f"
    done
}


if [ "$IS_TERMUX" = true ]; then
    install_deps_termux
fi

if [ "$1" = "remove" ]; then
    remove_qt6_files
else
    build_qt6
fi

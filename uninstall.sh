#!/bin/bash

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

styles=(
    "lightly"
    "Lightly"
    "Darkly"
    "darkly"
)

if [ "$IS_TERMUX" = false ] && [ $(whoami) != "root" ]; then
    echo "[ERROR]: This script needs sudo access to remove files."
    exit 1
fi

for style in ${styles[@]}; do
    $SUDO rm ${USR_PATH}/share/color-schemes/${style}.colors
    $SUDO rm ${USR_PATH}/lib/qt6/plugins/styles/${style}6.so*
    $SUDO rm ${USR_PATH}/share/kstyle/themes/${style}.themerc
    $SUDO rm ${USR_PATH}/lib/qt6/plugins/kstyle_config/${style}styleconfig.so*
    $SUDO rm ${USR_PATH}/share/applications/${style}styleconfig.desktop
    $SUDO rm ${USR_PATH}/bin/${style}-settings6
    $SUDO rm ${USR_PATH}/share/icons/hicolor/scalable/apps/${style}-settings.svgz
    $SUDO rm ${USR_PATH}/lib/qt6/plugins/org.kde.kdecoration3/org.kde.${style}.so*
    $SUDO rm ${USR_PATH}/share/kservices6/${style}decorationconfig.desktop
    $SUDO rm ${USR_PATH}/lib/qt6/plugins/org.kde.kdecoration3.kcm/kcm_${style}decoration.so*
    $SUDO rm ${USR_PATH}/share/applications/kcm_${style}decoration.desktop
    $SUDO rm ${USR_PATH}/lib/cmake/${style}/${style}Config.cmake
    $SUDO rm ${USR_PATH}/lib/cmake/${style}/${style}ConfigVersion.cmake
    $SUDO rm -r ${USR_PATH}/lib/cmake/${style}
done

################# includes #################
include_directories(
    animations
    debug
    ${CMAKE_SOURCE_DIR}/libdarklycommon
    ${CMAKE_BINARY_DIR}/libdarklycommon
)

################# configuration #################
configure_file(config-darkly.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config-darkly.h)

########### next target ###############
set(darkly_PART_SRCS
    animations/darklyanimation.cpp
    animations/darklyanimations.cpp
    animations/darklyanimationdata.cpp
    animations/darklybaseengine.cpp
    animations/darklybusyindicatordata.cpp
    animations/darklybusyindicatorengine.cpp
    animations/darklydialdata.cpp
    animations/darklydialengine.cpp
    animations/darklyenabledata.cpp
    animations/darklygenericdata.cpp
    animations/darklyheaderviewdata.cpp
    animations/darklyheaderviewengine.cpp
    animations/darklyscrollbardata.cpp
    animations/darklyscrollbarengine.cpp
    animations/darklyspinboxengine.cpp
    animations/darklyspinboxdata.cpp
    animations/darklystackedwidgetdata.cpp
    animations/darklystackedwidgetengine.cpp
    animations/darklytabbarengine.cpp
    animations/darklytabbardata.cpp
    animations/darklytoolboxengine.cpp
    animations/darklytransitiondata.cpp
    animations/darklytransitionwidget.cpp
    animations/darklywidgetstateengine.cpp
    animations/darklywidgetstatedata.cpp
    debug/darklywidgetexplorer.cpp
    darklyaddeventfilter.cpp
    darklyblurhelper.cpp
    darklyframeshadow.cpp
    darklyhelper.cpp
    darklymdiwindowshadow.cpp
    darklymnemonics.cpp
    darklypropertynames.cpp
    darklyshadowhelper.cpp
    darklysplitterproxy.cpp
    darklystyle.cpp
    darklystyleplugin.cpp
    darklytileset.cpp
    darklywindowmanager.cpp
    darklytoolsareamanager.cpp
)

kconfig_add_kcfg_files(darkly_PART_SRCS ../kdecoration/darklysettings.kcfgc)
kconfig_add_kcfg_files(darkly_PART_SRCS darklystyleconfigdata.kcfgc)

add_library(darkly6 MODULE ${darkly_PART_SRCS})

################# find Qt modules #################
find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets Quick QuickWidgets)

################# link Qt libraries #################
target_link_libraries(darkly6
    PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
    Qt6::DBus
    Qt6::Quick
)

if( DARKLY_HAVE_QTQUICK )
    target_link_libraries(darkly6
        PRIVATE
            Qt6::QuickWidgets
            KF6::CoreAddons
    )
endif()

################# link KDE Frameworks #################
target_link_libraries(darkly6
    PRIVATE
    KF6::CoreAddons
    KF6::ConfigCore
    KF6::ConfigGui
    KF6::GuiAddons
    KF6::IconThemes
    KF6::WindowSystem
    KF6::ColorScheme
)

if(DARKLY_HAVE_QTQUICK)
    target_link_libraries(darkly6 PRIVATE KF6::KirigamiPlatform)
endif()

################# link internal library #################
target_link_libraries(darkly6 PRIVATE darklycommon6)

################# KDE style integration #################
if(KF6FrameworkIntegration_FOUND)
    target_link_libraries(darkly6 PRIVATE KF6::Style)
endif()

if (WIN32)
    # As stated in https://docs.microsoft.com/en-us/cpp/c-runtime-library/math-constants M_PI only gets defined
    # when if _USE_MATH_DEFINES is defined
    target_compile_definitions(darkly6 PRIVATE _USE_MATH_DEFINES _BSD_SOURCE)
endif()


########### install files ###############
if (FOR_FLATPAK)
    set(LIB_TARGET ${QT_PLUGINS_DIR}/styles/)
else()
    set(LIB_TARGET ${KDE_INSTALL_QTPLUGINDIR}/styles/)
endif()
install(TARGETS darkly6 DESTINATION ${LIB_TARGET})

if (NOT FOR_FLATPAK)
    install(FILES darkly.themerc  DESTINATION  ${KDE_INSTALL_DATADIR}/kstyle/themes)
endif()

########### subdirectories ###############

if (TARGET "KF6::KCMUtils" AND NOT FOR_FLATPAK)
    add_subdirectory(config)
endif()


########### tests ###############
include(CTest)
if(BUILD_TESTING)
    add_subdirectory(tests)
endif()

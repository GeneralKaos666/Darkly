#####  config classes ææææææ

set(darklydecoration_config_SRCS
  ../darklyexceptionlist.cpp
    darklyconfigwidget.cpp
    darklydetectwidget.cpp
    darklyexceptiondialog.cpp
    darklyexceptionlistwidget.cpp
    darklyexceptionmodel.cpp
    darklyitemmodel.cpp
)
ki18n_wrap_ui(darklydecoration_config_SRCS
    ui/darklyconfigurationui.ui
    ui/darklydetectwidget.ui
    ui/darklyexceptiondialog.ui
    ui/darklyexceptionlistwidget.ui
)

add_library(kcm_darklydecoration MODULE kcm_darklydecoration.cpp ${darklydecoration_config_SRCS})

set_target_properties(kcm_darklydecoration PROPERTIES 
    PREFIX ""
)

install(TARGETS kcm_darklydecoration DESTINATION ${KDE_INSTALL_QTPLUGINDIR}/org.kde.kdecoration3.kcm)



kconfig_add_kcfg_files(kcm_darklydecoration ../darklysettings.kcfgc)
target_include_directories(kcm_darklydecoration PRIVATE ${CMAKE_SOURCE_DIR}/kdecoration ${CMAKE_BINARY_DIR}/kdecoration/)
target_link_libraries(kcm_darklydecoration
     PUBLIC
        Qt6::Core
        Qt6::Gui
        Qt6::DBus
        KDecoration3::KDecoration
     PRIVATE
        KF6::CoreAddons
        KF6::ConfigWidgets
        KF6::GuiAddons
        KF6::I18n
        KF6::IconThemes
        KF6::WindowSystem
        KF6::KCMUtils
)
kcmutils_generate_desktop_file(kcm_darklydecoration)

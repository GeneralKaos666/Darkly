add_library(darklycommon6 OBJECT darklyboxshadowrenderer.cpp)

set_target_properties(darklycommon6 PROPERTIES POSITION_INDEPENDENT_CODE TRUE)

target_link_libraries(darklycommon6
    PUBLIC
        Qt6::Core
        Qt6::Gui)


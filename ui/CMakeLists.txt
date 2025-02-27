cmake_minimum_required(VERSION 3.16)

set(PROJECT_NAME "Musubi")
project(${PROJECT_NAME} VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Get dependencies
find_package(Qt6 REQUIRED COMPONENTS Core Quick)

# qt_policy(SET QTP0001 NEW)

qt_standard_project_setup()

set(QT_APP_NAME "${PROJECT_NAME}App")

add_subdirectory(src)   # Get SOURCES
add_subdirectory(qml)   # Get QML_SOURCES

qt_add_executable(${QT_APP_NAME} ${SOURCES})

qt_add_qml_module(${QT_APP_NAME}
    URI MusubiUi
    VERSION 1.0
    QML_FILES ${QML_SOURCES}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${QT_APP_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.${QT_APP_NAME}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${QT_APP_NAME}
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS ${QT_APP_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
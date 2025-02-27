cmake_minimum_required(VERSION 3.16)

# Cache variables
SET(Qt_INSTALL_DIR CACHE STRING "Path where Qt is installed")

# Add cmake paths
set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${Qt_INSTALL_DIR})

# add_subdirectory(lib)
add_subdirectory(ui)
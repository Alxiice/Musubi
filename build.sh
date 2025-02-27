#!/usr/bin/env bash

PROJECT_ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# CMake variables
eval Qt_INSTALL_DIR="~/Qt/6.8.1/gcc_64"

# Build
if [ ! -d $PROJECT_ROOT/build ]; then
    mkdir $PROJECT_ROOT/build;
fi
cd $PROJECT_ROOT/build
cmake .. -DQt_INSTALL_DIR="$Qt_INSTALL_DIR" -Wno-dev
cmake --build . --config Release
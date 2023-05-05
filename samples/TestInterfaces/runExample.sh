#!/bin/bash

name=TestInterfaces

exe_name=${name}
exe_path=./bin

# Check if LD_LIBRARY_PATH environment variable was set.
if [[ "$LD_LIBRARY_PATH" == "" ]]; then
    echo Please ensure LD_LIBRARY_PATH environment variable is set to libraries
    echo For example export LD_LIBRARY_PATH=../../lib
    exit 1
fi

# Create subdirectories
mkdir -p $exe_path

# Compiling
swiftc ./src/${name}.swift \
   ../../services/Services.swift \
   ../../services/Loader.swift \
   ../../drivers/TestInterfaceDriver.swift \
   ../../wrappers/DllMainWrapper.swift -o $exe_path/$exe_name

if [[ "$?" != 0 ]]; then
    echo "Error compiling code"
    exit 1
fi

echo Running example
$exe_path/$exe_name

if [[ "$?" != 0 ]]; then
    echo "Error executing $exe_name"
    exit 1
fi

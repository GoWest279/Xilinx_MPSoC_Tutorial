# Hello World from MPSoC

## Description

Run Hello word from MPSoC through FPGA

## Getting Started

### Dependencies

CMKAE package for vscode

### C++ code

main.cpp: takes one input string and then output it.

```cpp
#include <iostream>
int main(int argc, char* argv[]) {
    if(argc < 2) {
        std::cout<<"[Wrong]only " << argc <<" received"<<std::endl;
        std::cout<<"       ./main string_to_print" <<std::endl;
        return 1;
    }
    else 
        std::cout<<"[Correct]Input string: "<< argv[1] << std::endl;
    return 0;
}
```

### cmake configuration file

CMakeLists.txt: Setup the build parameters

```cmake
# project name
project(main)
# configure the build type to Debug
set(CMAKE_BUILD_TYPE Debug) 
# configure the executable binary and source code
add_executable(main main.cpp)
```

### vscode setup file

* .vscode/settings.json: configure the input parameter

```json
{
    "cmake.debugConfig": {
        "args": [
            "debug test string"
        ]
    }
}
```

## Usage

### Compile

```shell
mkdir build && cd build
cmake ../
make
```

### Debug

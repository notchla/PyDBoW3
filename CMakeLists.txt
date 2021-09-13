cmake_minimum_required(VERSION 3.4...3.18)
project(pydbow3)

LIST(APPEND CMAKE_MODULE_PATH 
    ${PROJECT_SOURCE_DIR}/cmake
)

add_subdirectory(modules/pybind11)

find_package(OpenCV REQUIRED)
find_package(DBoW3 REQUIRED)

pybind11_add_module(pydbow3 
    src/py_dbow3.cpp
    src/ndarray_converter.cpp
)

target_link_libraries(pydbow3
PRIVATE
    ${OpenCV_LIBS}
    ${DBoW3_LIBS}
)

target_compile_definitions(pydbow3 
PRIVATE 
    VERSION_INFO=${EXAMPLE_VERSION_INFO}
)

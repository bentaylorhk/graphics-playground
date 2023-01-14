# Benjamin Michael Taylor (bentaylorhk)
# 2023

cmake_minimum_required(VERSION 3.20)

project(
        graphics-playground
        VERSION 1.0
        DESCRIPTION "Project for small graphics and image processing projects"
)

set(CMAKE_CXX_STANDARD 20)

include(cmake/targets.cmake)

find_package(OpenCV REQUIRED)

add_subdirectory(src)

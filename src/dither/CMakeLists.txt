# Benjamin Michael Taylor (bentaylorhk)
# 2023

file (GLOB_RECURSE SOURCES CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

create_target(
        NAME "dither"
        SOURCES ${SOURCES}
        INCLUDES ${CMAKE_CURRENT_SOURCE_DIR}
        SYSTEM_INCLUDES ${OpenCV_INCLUDE_DIRS}
        PRIVATE_LIBS ${OpenCV_LIBS}
        EXECUTABLE
)

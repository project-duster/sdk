cmake_minimum_required(
    VERSION 3.21
)

include(cmake/prelude.cmake)

project(
    sdk
    VERSION 0.1.0
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# Add Library

set(SDK_SRC
    ${CMAKE_CURRENT_SOURCE_DIR}/src/windows/plugin.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/linux/plugin.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/sdk.cpp
)

add_library(sdk_sdk ${SDK_SRC})
add_library(sdk::sdk ALIAS sdk_sdk)

include(GenerateExportHeader)
generate_export_header(
    sdk_sdk
    BASE_NAME sdk
    EXPORT_FILE_NAME export/sdk/sdk_export.hpp
)

if(NOT BUILD_SHARED_LIBS)
  target_compile_definitions(sdk_sdk PUBLIC SDK_STATIC_DEFINE)
endif()

set_target_properties(
    sdk_sdk PROPERTIES
    CXX_VISIBILITY_PRESET hidden
    CMAKE_VISIBILITY_INLINES_HIDDEN ON
    VERSION "${PROJECT_VERSION}"
    SOVERSION "${PROJECT_VERSION_MAJOR}"
    EXPORT_NAME sdk
    OUTPUT_NAME sdk
)

target_include_directories(
    sdk_sdk ${warning_guard}
    PUBLIC
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
)

target_include_directories(
    sdk_sdk SYSTEM
    PUBLIC
    $<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/export>
)

# Add dependencies
find_package(SDL2 REQUIRED)
find_package(FMT REQUIRED)

# target_link_libraries(sdk_sdk PUBLIC mingw32 SDL2::SDL2main SDL2::SDL2 fmt::fmt)


# Install rules

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# Dev mode

if(NOT sdk_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of sdk"
  )
endif()


include(cmake/dev-mode.cmake)

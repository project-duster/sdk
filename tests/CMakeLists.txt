cmake_minimum_required(VERSION 3.24)

project(sdkTests LANGUAGES CXX)

include(../cmake/project-is-top-level.cmake)
include(../cmake/folders.cmake)
include(../cmake/windows-set-path.cmake)

# ---- Dependencies ----

if(PROJECT_IS_TOP_LEVEL)
  find_package(sdk REQUIRED)
  enable_testing()
endif()

# ---- Tests ----
find_package(Catch2 3 REQUIRED)

add_executable(sdk_test src/sdk_test.cpp)
target_link_libraries(sdk_test PRIVATE Catch2::Catch2WithMain sdk::sdk)
target_compile_features(sdk_test PRIVATE cxx_std_17)

add_test(NAME sdk_test COMMAND sdk_test WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
# windows_set_path(sdk_test sdk::sdk)

# ---- End-of-file commands ----

add_folders(Test)

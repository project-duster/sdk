cmake_minimum_required(VERSION 3.20)

project(sdkTests LANGUAGES CXX)

include(../cmake/folders.cmake)
include(../cmake/windows-set-path.cmake)

# ---- Dependencies ----

if(PROJECT_IS_TOP_LEVEL)
  find_package(sdk REQUIRED)
  enable_testing()
endif()

# ---- Tests ----
find_package(Catch2 3 REQUIRED
  PATHS "D:/Program Files/Catch2"
)

add_executable(sdk_test src/sdk_test.cpp)
target_link_libraries(sdk_test PRIVATE sdk::sdk Catch2::Catch2WithMain)
target_compile_features(sdk_test PRIVATE cxx_std_17)

add_test(NAME sdk_test COMMAND sdk_test)
windows_set_path(sdk_test sdk::sdk)

# ---- End-of-file commands ----

add_folders(Test)

if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_INSTALL_INCLUDEDIR include/sdk CACHE PATH "")
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package sdk)

install(
    DIRECTORY
    include/
    "${PROJECT_BINARY_DIR}/export/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT sdk_Development
)

install(
    TARGETS sdk_sdk
    EXPORT sdkTargets
    RUNTIME #
    COMPONENT sdk_Runtime
    LIBRARY #
    COMPONENT sdk_Runtime
    NAMELINK_COMPONENT sdk_Development
    ARCHIVE #
    COMPONENT sdk_Development
    INCLUDES #
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    sdk_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(sdk_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${sdk_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT sdk_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${sdk_INSTALL_CMAKEDIR}"
    COMPONENT sdk_Development
)

install(
    EXPORT sdkTargets
    NAMESPACE sdk::
    DESTINATION "${sdk_INSTALL_CMAKEDIR}"
    COMPONENT sdk_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()

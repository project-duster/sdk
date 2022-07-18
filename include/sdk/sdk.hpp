#pragma once

#include <string>

#include "sdk/plugin.hpp"

#include "sdk/sdk_export.hpp"

namespace sdk {

SDK_EXPORT auto greeting() -> std::string;
auto not_exported() -> void;

} // namespace sdk

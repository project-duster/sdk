#include "sdk/sdk.hpp"

namespace sdk {
auto greeting() -> std::string {
    return "h";
}
auto not_exported() -> void {
    return;
}
} // namespace sdk
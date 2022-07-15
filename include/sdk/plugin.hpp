#pragma once

// #include <array>
// #include <memory>
// #include <string>
// #include <vector>

// #include "entt/entt.hpp"
// #include "system.hpp"
#include <SDL2/SDL.h>

#include "sdk/sdk_export.hpp"

namespace ung::sdk {

struct SDK_EXPORT plugin {

    //     Plugin(const char *name, std::array<uint32_t, 3> version) : name(name), version(version) {}

    //     std::string name;
    //     std::array<uint32_t, 3> version;
    //     std::vector<std::unique_ptr<System>> systems;
};

struct plugin_service {
    //     ~PluginService();
    //     auto load_plugin(const char *path) -> void;
    //     auto initialize_plugins(SDL_Window *window) -> void;

    //     std::vector<Plugin> plugins;
    //     std::vector<void *> plugin_libs;
};

} // namespace ung::sdk

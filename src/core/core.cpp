#include <core/core.h>

#include <fmt/format.h>

namespace core {

std::string getProjectDescription(Eigen::Vector3i version) {
    return fmt::format("modern-cmake-superbuild template v{:d}.{:d}.{:d}", version(0), version(1), version(2));
}

} // namespace core

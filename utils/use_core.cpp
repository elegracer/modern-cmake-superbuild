#include <core/core.h>

#include <iostream>
#include <string>

#include <Eigen/Eigen>

int main(int argc, const char* argv[]) {
#ifdef CORE_OPTION
    std::cout << "CORE_OPTION defined" << std::endl;
#else
    std::cout << "CORE_OPTION undefined" << std::endl;
#endif

    Eigen::Vector3i version{CORE_MAJOR_VERSION, CORE_MINOR_VERSION, CORE_PATCH_VERSION};
    std::cout << core::getProjectDescription(version) << std::endl;
    return 0;
}

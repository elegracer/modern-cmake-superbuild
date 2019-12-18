#pragma once

#include <core/version.h>

#include <string>
#include <Eigen/Eigen>

namespace core {

std::string getProjectDescription(Eigen::Vector3i version);
}

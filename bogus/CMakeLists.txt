project(libbogus CXX)
cmake_minimum_required(VERSION 2.8)

set(BOGUS_VERSION_MAJOR 0)
set(BOGUS_VERSION_MINOR 0)
set(BOGUS_VERSION_PATCH 1)

find_package(Lua51 REQUIRED)

include_directories(${LUA_INCLUDE_DIR})

add_library(bogus SHARED bogus.cpp greeter.hpp greeter.cpp)
target_link_libraries(bogus ${LUA_LIBRARIES})
set_target_properties(bogus PROPERTIES PREFIX "" VERSION "${BOGUS_VERSION_MAJOR}.${BOGUS_VERSION_MINOR}.${BOGUS_VERSION_PATCH}" SOVERSION  "${BOGUS_VERSION_MAJOR}.${BOGUS_VERSION_MINOR}.${BOGUS_VERSION_PATCH}")


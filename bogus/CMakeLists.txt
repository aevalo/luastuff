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

add_custom_target(foobar ALL
                    COMMAND luac -s -o ${CMAKE_BINARY_DIR}/foobar.lc foobar.lua
                    WORKING_DIRECTORY ${CMAKE_HOME_DIRECTORY}
                    COMMENT "Compiling Lua module..."
                    VERBATIM
                    SOURCES foobar.lua)

install(TARGETS bogus DESTINATION bin)
install(FILES ${CMAKE_BINARY_DIR}/foobar.lc DESTINATION bin)
install(FILES test.lua DESTINATION bin PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_WRITE GROUP_EXECUTE)


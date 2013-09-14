#include <iostream>
#include <lua.hpp>

#define PROJECT_TABLENAME "myhello"
#ifdef WIN32
#   define LUA_API __declspec(dllexport)
#else
#   define LUA_API
#endif


extern "C" {
    int LUA_API luaopen_myhello(lua_State *L);
}

static int helloworld(lua_State *L) {
    std::cout << "Hello, World!!!" << std::endl;
    return 0;
}

int LUA_API luaopen_myhello(lua_State *L) {
    struct luaL_reg driver[] = {
        {"helloworld", helloworld},
        {NULL, NULL},
    };
    luaL_openlib(L, "myhello", driver, 0);
    return 1;
}

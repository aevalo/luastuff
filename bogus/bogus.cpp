#include <iostream>
#include "greeter.hpp"

extern "C"
{
#define lboguslib_cpp
#define LUA_LIB
#ifdef WIN32
#define LUA_BUILD_AS_DLL
#endif
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
}


namespace
{
    const char* LUA_BOGUSLIBNAME = "bogus";
    const int theAnswer = 42;
    
    int bogus_greet( lua_State* L )
    {
        greeter g;
        int n = lua_gettop( L );
        if ( n > 0 )
        {
            g.greet( luaL_checkstring( L, 1 ) );
        }
        else
        {
            g.greet();
        }
        return 1;
    }
    
    int bogus_answer( lua_State* L )
    {
        lua_pushnumber( L, theAnswer );
        return 1;
    }
    
    int bogus_sum_args( lua_State* L )
    {
        int n = lua_gettop( L );  // number of arguments
        lua_Number d = 0;
        for ( int i = 1; i<= n; i++ )
        {
            d += luaL_checknumber( L, i );
        }
        lua_pushnumber( L, d );
    return 1;
    }
    
    const luaL_Reg boguslib[] = {
        {"greet",   bogus_greet},
        {"answer",   bogus_answer},
        {"sum_args",  bogus_sum_args},
        {NULL, NULL}
    };
}


//
// Open bogus library
//
extern "C"
{

LUALIB_API int luaopen_bogus( lua_State *L )
{
  luaL_register( L, LUA_BOGUSLIBNAME, boguslib );
  lua_pushnumber( L, theAnswer );
  lua_setfield( L, -2, "ANSWER" );

  return 1;
}

}


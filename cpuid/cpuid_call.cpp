#include <iostream>
#include <cstring>

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

void get_vendor_id( char* vendorid );
}

void blass()
        {
            char vendorID[ 13 ];
            memset( vendorID, 0, 13 );
            get_vendor_id( vendorID );
            std::cout << "Vendor ID: " << vendorID << std::endl;
        }



namespace
{

    const char* LUA_CPUIDLIBNAME = "cpuid";
    
    int cpuid_vendorid( lua_State* L )
    {
        char vendorID[ 13 ];
        memset( vendorID, 0, 13 );
        get_vendor_id( vendorID );
        lua_pushstring( L, vendorID );
        return 1;
    }
    
    const luaL_Reg cpuidlib[] = {
        {"VendorID",   cpuid_vendorid},
        {NULL, NULL}
    };
}

extern "C"
{
    LUALIB_API int luaopen_cpuid( lua_State *L )
    {
    luaL_register( L, LUA_CPUIDLIBNAME, cpuidlib );
    return 1;
    }
}


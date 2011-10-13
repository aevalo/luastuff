package = "bogus"
version = "0.0-1"
source = {
   url = ""
}
description = {
   summary = "An example for the LuaRocks tutorial.",
   detailed = [[
      This is an example for the LuaRocks tutorial.
      Here we would put a detailed, typically
      paragraph-long description.
   ]],
   homepage = "",
   license = "MIT/X11"
}
dependencies = {
   "lua >= 5.1"
}
--external_dependencies = {
--   LIBLUA = {
--      header = "lua.h"
--   }
--}
build = {
   type = "cmake",
   variables = {
      CMAKE_BUILD_TYPE = "Release"
   },
   modules = {
      bogus = {
         sources = {"bogus.cpp"},
         libraries = {"lua5.1"}
      }
   }
}

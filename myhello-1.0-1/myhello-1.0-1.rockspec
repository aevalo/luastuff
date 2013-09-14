package = "myhello"
version = "1.0-1"
source = {
   url = "../"..package.."-"..version..".tar.bz2"
}
description = {
   summary = "An example for the LuaRocks tutorial.",
   detailed = [[
      This is an example for the LuaRocks tutorial.
      Here we would put a detailed, typically
      paragraph-long description.
   ]],
   homepage = "http://...", -- We don't have one yet
   license = "MIT/X11" -- or whatever you like
}
dependencies = {
   "lua ~> 5.1"
   -- If you depend on other rocks, add them here
}
external_dependencies = {
   LIBLUA = {
      header = "lua.hpp"
   }
}
build = {
   type = "builtin",
   modules = {
      -- A simple module written in C
      myhello = {
         sources = {"src/mod_myhello.cpp"},
         defines = {},
         libraries = {"lua"},
         incdirs = {"$(LIBLUA_INCDIR)"},
         libdirs = {"$(LIBLUA_LIBDIR)"}
      }
   }
}

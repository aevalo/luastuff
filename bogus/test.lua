#!/usr/bin/lua

-- Make sure we can load compiled Lua scripts (.lc)
package.path = package.path .. ";?.lc"
require("foobar")

foobar = foobar.createNewObject()

foobar:answer()
foobar:sumArgs( 1, 2, 3 )
foobar:greet()
foobar:greetUser()


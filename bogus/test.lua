#!/usr/bin/lua
require("bogus")

print( "answer() tells us the answer is " .. bogus.answer() )
print( "ANSWER tells us the answer is " .. bogus.ANSWER )

print( "Sum of 1, 2, 3, 4 and 5 is " .. bogus.sum_args( 1, 2, 3, 4, 5 ) )

bogus.greet()
bogus.greet( "Arttu" )


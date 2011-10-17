require("bogus")
local print = print
local io = io
local bogus = bogus

module("foobar");

function createNewObject()
    local object = {}
    
    function object.answer( self )
        print( "answer() tells us the answer is " .. bogus.answer() )
        print( "ANSWER tells us the answer is " .. bogus.ANSWER )
    end
    
    function object.sumArgs( self, a, b, c )
        print( "Sum of " .. a .. ", " .. b .. " and " .. c .. " is " .. bogus.sum_args( a, b, c ) )
    end
    
    function object.greet( self )
        bogus.greet()
    end
    
    function object.greetUser( self )
        io.write( "Please, introduce your self: " )
        local name = io.read()
        bogus.greet( name )
    end
    
    return object
end


local _G = _G
require("bogus")

module("foobar");

function createNewObject()
    local object = {}
    
    function object.answer( self )
        _G.print( "answer() tells us the answer is " .. _G.bogus.answer() )
        _G.print( "ANSWER tells us the answer is " .. _G.bogus.ANSWER )
    end
    
    function object.sumArgs( self, a, b, c )
        _G.print( "Sum of " .. a .. ", " .. b .. " and " .. c .. " is " .. _G.bogus.sum_args( a, b, c ) )
    end
    
    function object.greet( self )
        _G.bogus.greet()
    end
    
    function object.greetUser( self )
        _G.io.write( "Please, introduce your self: " )
        local name = _G.io.read()
        _G.bogus.greet( name )
    end
    
    return object
end


#include <iostream>
#include "greeter.hpp"


greeter::greeter()
{
}

greeter::~greeter()
{
}

void greeter::greet()
{
    std::cout << "Hello, World!!!" << std::endl;
}

void greeter::greet( const char* name )
{
    std:: cout << "Hello, there!";
    if ( name )
    {
        std::cout << " Nice to meet you, " << name;
    }
    std::cout << "." << std::endl;
}



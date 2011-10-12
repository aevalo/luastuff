#ifndef GREETER_HPP
#define GREETER_HPP

class greeter
{
    public:
        greeter();
        ~greeter();
        
        void greet();
        void greet( const char* name );
};

#endif // GREETER_HPP


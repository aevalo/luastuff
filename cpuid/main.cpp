// 
// main.cpp
// 
// Illustrates how to call the maxofthree function we wrote in assembly
// language.
//

#include <iostream>
#include <cstring>

#ifdef __cplusplus
extern "C" {
#endif

long maxofthree( long a, long b, long c );
int get_vendor_id( char* vendor_id );

#ifdef __cplusplus
}
#endif


int main()
{
    std::cout << maxofthree(  1, -4, -7 ) << std::endl;
    std::cout << maxofthree(  2, -6,  1 ) << std::endl;
    std::cout << maxofthree(  2,  3,  1 ) << std::endl;
    std::cout << maxofthree( -2,  4,  3 ) << std::endl;
    std::cout << maxofthree(  2, -6,  5 ) << std::endl;
    std::cout << maxofthree(  2,  4,  6 ) << std::endl;
    
    char vendorID[ 20 ];
    memset( vendorID, 0, 20 );
    get_vendor_id( vendorID );
    std::cout << "Vendor ID: " << vendorID << std::endl;
    
    return 0;
}


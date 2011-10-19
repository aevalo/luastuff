all: clean cpuid.o main.o cpuid_impl.o 
	g++ -g -o cpuid tmp/cpuid_impl.o tmp/main.o
	g++ -shared tmp/cpuid_impl.o tmp/cpuid_call.o -o cpuid.so `pkg-config --libs lua5.1`

cpuid.o: mk_build_tree
	nasm -o tmp/cpuid_impl.o -f elf32 cpuid_impl.asm

main.o: mk_build_tree
	g++ -c -g -o tmp/main.o main.cpp

cpuid_impl.o: mk_build_tree
	g++ -c -g -o tmp/cpuid_call.o cpuid_call.cpp `pkg-config --cflags lua5.1`

mk_build_tree:
	mkdir -p tmp

clean:
	rm -rf cpuid tmp *.so

test: all
	./test.lua

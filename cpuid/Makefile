all: clean cpuid.o main.o 
	g++ -g -o cpuid tmp/cpuid_impl.o tmp/main.o

cpuid.o: mk_build_tree
	nasm -o tmp/cpuid_impl.o -f elf cpuid_impl.asm

main.o: mk_build_tree
	g++ -c -g -o tmp/main.o main.cpp

mk_build_tree:
	mkdir -p tmp

clean:
	rm -rf cpuid tmp *.so

test: all
	./test.lua

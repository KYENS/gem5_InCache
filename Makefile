all:
	g++ --static -I include  -o tests/ndp-test-progs/x86/test1 tests/ndp-test-progs/test1.cpp util/m5/build/x86/out/libm5.a

SHELL=/bin/sh
VPATH=./include
srcs=main.c
export CFLAGS=-g -Wall -MMD -fprofile-arcs -ftest-coverage -c
simple:main.o libtset
	gcc -pg -o $@ $< -L$(shell pwd)/lib -ltest -lgcov
		 	
main.o:main.c 
	cc $(CFLAGS) $< -o $@

libtset:
	$(MAKE) -C lib	 

ifneq ($(MAKECMDGOALS),clean) 
-include $(srcs:.c=.d)
endif 

.PHONY : clean install
clean : 
	rm simple ./lib/*gcov ./lib/*gcda ./lib/*gcno *gcov *gcda *gcno ./lib/*gcno *.out *.o *.d ./lib/*.o ./lib/*.d ./lib/*.a ./bin/simple

install:
	install simple ./bin
 
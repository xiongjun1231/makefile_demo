objs=fun1.o fun2.o
libtest.a:$(objs)
	ar rcs $@ $^

$(objs):%.o:%.c
	cc $(CFLAGS) $< -o $@

	

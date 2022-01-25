simple: simple.o
	ld -o simple simple.o

simple.o: simple.s
	as -g -o simple.o simple.s

all: trabalho

trabalho: trabalho.o
	ld trabalho.o -o trabalho

trabalho.o: trabalho.asm
	nasm -g -f elf64 trabalho.asm -o trabalho.o

clean:
	rm -f trabalho.o trabalho

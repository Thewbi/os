# Makefile for JamesM's kernel tutorials.
# The C and C++ rules are already setup by default.
# The only one that needs changing is the assembler 
# rule, as we use nasm instead of GNU as.

SOURCES=boot.o main.o monitor.o common.o

# 64bit
#ASFLAGS=-felf64
#LDFLAGS=-Tlink.ld -o 64bit
#CFLAGS=-nostdlib -nostdinc -fno-builtin -fno-stack-protector

# 32bit
ASFLAGS=-felf32
LDFLAGS=-Tlink.ld -melf_i386
CFLAGS=-m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector

#ASFLAGS=-felf

#LDFLAGS=-Tlink.ld -melf_i386
#LDFLAGS=-Tlink.ld -m32
#LDFLAGS=-Tlink.ld

all: $(SOURCES) link

clean:
	-rm *.o kernel

link:
	ld $(LDFLAGS) -o kernel $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<

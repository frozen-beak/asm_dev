# ASM Dev

nasm -f elf64 f.asm -o f.o
ld f.o -o f

# Notes

- Instruction

A command for the CPU to perform certain actions. E.g.

`mov` - Transfer data from one register to another
`int` - Is used to generate Interrupt, mostly to request services from OS(Sys Calls)

- Register

A small storgae location in CPU, used to hold data and instructions temporarily.

There are two types,

1. General Purpose
2. Special Purpose

E.g.,

`eax` - Accumulator, Used to temporarily store results of computation
`ebx` - Base pointer for memory access
`edx` - I/O Operations, also holds intermediate results in arithmetic operations (e.g. remainder of a division)





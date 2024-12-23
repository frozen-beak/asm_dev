# ASM Dev

`nasm -f elf64 f.asm -o f.o`

`ld f.o -o f`

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

`eax` - Accumulator, Used to temporarily store results of computation.

`ebx` - Base pointer for memory access.

`edx` - I/O Operations, also holds intermediate results in arithmetic operations 
(e.g. remainder of a division).

`ecx` - Used for data manipulation. Often used as a counter in loop and string manipulation.


- Directive

Assembler directives are special instructions in assembly language that provide guidance to 
the assembler on how to process the source code. E.g.,

`data` -  Marks the beginning of a data segment where initialized data is defined.

`text` - Indicates the start of the code segment where executable instructions are located.

`equ` - Defines/assigns a constant value to a symbolic name

`bss` - Reserves space for uninitialized data.

`org` - Sets the origin or starting address for subsequent instructions or data.


- Common Conditional Jumps

```asm

je A, B		; Jump if equal
jne A, B	; Jump if not equal
jg A, B		; Jump if greater
jge A, B	; Jump if greater or equal
jl A, B		; Jump if less
jle A, B	; Jump if less or equal

```


- Stack

`esp` - Stack pointer, always points to the top of the stack in memory

- Common Data Types

`db` - Stores 1 byte

`dw` - Stores 2 bytes

`dd` - Stores 4 bytes



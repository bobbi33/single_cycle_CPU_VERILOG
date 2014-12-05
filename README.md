single_cycle_CPU_VERILOG
========================

The simple CPU example discussed here is accumulator based with a 16-bit data bus and a 16-bit address bus. This CPU has 7 instructions that are shown in Table 1. Instructions are one word instructions (16 bit) and have a 3-bit opcode field. The remaining 13 bits of an instruction form the memory address field. Fig. 1 shows the instructions format. Show single cycle implementation of this processor assuming one clock memory write operations, and combinational read operations. Describe this machine in Verilog and write a testbench that reads mnemonics translates them to the processor machine language and runs the input code. Provide the necessary start and resetting controls. 




Table 1: CPU Instruction Set
  Opcode	Instruction	Comments
  
  000	LDA	Load Accumulator
  001	STA	Store Accumulator
  010	ADD	Add addressed memory with accumulator  
  011	SUB	Subtract addressed memory from accumulator
  100	JMP	Unconditional direct jump
  101	JEZ	Direct jump when Acc is equal to zero
  110	LDI	Load Accumulator Immediate, sign extend
  111	HLT	Halt, no more fetching until a new start



Opcode	Memory Address
			15        1312       			0                
Figure 1: Instructions Format

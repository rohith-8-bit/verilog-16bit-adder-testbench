# verilog-16bit-adder-testbench
16-bit Ripple-Carry Adder with ALU Flags and Simulation Testbench in Verilog

This repository contains a hierarchical Verilog implementation of a 16-bit binary adder (adder16) along with a simulation testbench (alutest). The adder is built using a ripple-carry architecture and modular design:

adder2: 1-bit full adder

adder4: 4-bit ripple adder (built from adder2)

adder16: 16-bit adder with flag outputs (built from adder4)

The top-level adder16 module computes the sum of two 16-bit operands and outputs standard ALU flags:

S → Sign bit (Z[15])

ZR → Zero result flag

CY → Carry-out

P → Parity flag (even)

V → Signed overflow flag

# Verilog Programming

NOTE: I will be using Xilinx Vivado ML Edition 2024.2 version for analysis and synthesis of the digital designs. But if this large software cannot be installed on the local machine, then there is also an option utilizing icarus verilog and GTKwave. I have installed these two softwares on Ubuntu 22.04.05 LTS.

To compile and run Verilog modules using ICARUS,
1) Write Verilog module using any code editor(I use Vim or VScode) and save as example.v
2) Write corresponding test bench and save as example_tb.v
3) Compile the verilog module along with test bench using iverilog command and save the output in file "example" <br>
`iverilog -o example example.v example_tb.v`
4) Run the compiled output file using vvp command <br>
`vvp example`
5) To show the waveform, type the following command along with the dump file example.vcd <br>
`gtkwave example.vcd`

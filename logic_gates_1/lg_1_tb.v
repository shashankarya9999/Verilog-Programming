`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2025 02:44:46 PM
// Design Name: 
// Module Name: logic_gates_1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lg_1_tb;

reg a,b,c,d,e,f;
wire y;
logic_gates_1  DUT(a,b,c,d,e,f,y);

initial
    begin
        $dumpfile("lg_1.vcd");
	$dumpvars(0,lg_1_tb);
	$monitor($time,
        "a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, y=%b",
        a,b,c,d,e,f,y);
        #5 a=1; b=0; c=0; d=1; e=0; f=0;
        #5 a=0; b=0; c=1; d=1; e=0; f=0;
        #5 a=1; c=0;
        #5 f=1;
        #5 $finish;
    end   

endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2025 02:40:28 PM
// Design Name: 
// Module Name: logic_gates_1
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


module logic_gates_1(a,b,c,d,e,f,y);

input a,b,c,d,e,f;
output y;
wire t1,t2,t3,y;
nand #1 G1(t1,a,b);
//      G4(y,t1,t2,t3);
and #2 G2(t2,c,~b,d);
nor #1 G3(t3,e,f);
nand #1 G4(y,t1,t2,t3);

endmodule


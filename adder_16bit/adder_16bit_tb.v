`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2025 11:07:26 PM
// Design Name: 
// Module Name: adder_16bit_tb
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


module adder_16bit_tb;

    reg [15:0] x,y;
    wire [15:0] z;
    wire s,zr,cy,p,v;
    
    adder_16bit DUT(x,y,z,s,zr,cy,p,v);
    
    initial begin
        
            $dumpfile("adder_16bit_tb.vcd");
            $dumpvars(0,adder_16bit_tb);
            $monitor($time,
            " x = %h, y = %h, z = %h, s = %b, zr = %b, cy = %b, p = %b, v = %b"
            ,x,y,z,s,zr,cy,p,v);
            #5 x = 16'h8fff; y = 16'h8000;
            #5 x = 16'hfffe; y = 16'h0002;
            #5 x = 16'haaaa; y = 16'h5555;
            #5 $finish;
    end
endmodule

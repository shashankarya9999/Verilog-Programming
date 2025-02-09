`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2025 11:02:55 PM
// Design Name: 
// Module Name: adder_16bit
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

// module adder_16bit(x,y,z,sign,zero,carry,parity,overflow);
    
//     input [15:0] x,y;
//     output [15:0] z;
//     output sign,zero,carry,parity,overflow;
    
//     assign {carry,z} = x+y;
//     assign sign = z[15];
//     assign zero = ~|z;
//     assign parity = ~^z;
//     assign overflow = (x[15]&y[15]&~z[15])|(~x[15]&~y[15]&z[15]);

// endmodule

//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2025 11:02:55 PM
// Design Name: 
// Module Name: adder_16bit
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

// Behavioral description of a 16-bit adder
//module adder_16bit(x,y,z,sign,zero,carry,parity,overflow);
    
//    input [15:0] x,y;
//    output [15:0] z;
//    output sign,zero,carry,parity,overflow;
    
//    assign {carry,z} = x+y;
//    assign sign = z[15];
//    assign zero = ~|z;
//    assign parity = ~^z;
//    assign overflow = (x[15]&y[15]&~z[15])|(~x[15]&~y[15]&z[15]);

//endmodule

// Structural description of 16-bit adder using 4-bit adder blocks(with ripple carry between blocks)
// module adder_4bit(a,b,cin,s,cout);

//     input [3:0] a,b;
//     input cin;
//     output [3:0] s;
//     output cout;
    
//     assign {cout,s}=a+b+cin;

// endmodule

// module adder_16bit(x,y,z,sign,zero,carry,parity,overflow);
    
//     input [15:0] x,y;
//     output [15:0] z;
//     output sign,zero,carry,parity,overflow;
//     wire c[3:1];
    
//     //assign {carry,z} = x+y;
//     assign sign = z[15];
//     assign zero = ~|z;
//     assign parity = ~^z;
//     assign overflow = (x[15]&y[15]&~z[15])|(~x[15]&~y[15]&z[15]);

//     adder_4bit A0(x[3:0],y[3:0],1'b0,z[3:0],c[1]);
//     adder_4bit A1(x[7:4],y[7:4],c[1],z[7:4],c[2]);
//     adder_4bit A2(x[11:8],y[11:8],c[2],z[11:8],c[3]);
//     adder_4bit A3(x[15:12],y[15:12],c[3],z[15:12],carry);

// endmodule

// Structural modeling of Ripple Carry Adder
// module full_adder(a,b,cin,s,cout);

//     input a,b,cin;
//     output s,cout;
//     wire s1,c1,c2;

//     xor G1(s1,a,b), G2(s,s1,cin), G3(cout,c2,c1);
//     and G4(c1,a,b), G5(c2,s1,c);
    
//     // assign {cout,s}=a+b+cin;

// endmodule

// module adder_4bit(a,b,cin,s,cout);

//     input [3:0] a,b;
//     input cin;
//     output [3:0] s;
//     output cout;
//     wire c1,c2,c3;

//     full_adder FA0(a[0],b[0],cin,s[0],c1);
//     full_adder FA1(a[1],b[1],c1,s[1],c2);
//     full_adder FA2(a[2],b[2],c2,s[2],c3);
//     full_adder FA3(a[3],b[3],c3,s[3],cout);

// endmodule

// module adder_16bit(x,y,z,sign,zero,carry,parity,overflow);
    
//     input [15:0] x,y;
//     output [15:0] z;
//     output sign,zero,carry,parity,overflow;
//     wire c[3:1];
    
//     //assign {carry,z} = x+y;
//     assign sign = z[15];
//     assign zero = ~|z;
//     assign parity = ~^z;
//     assign overflow = (x[15]&y[15]&~z[15])|(~x[15]&~y[15]&z[15]);

//     adder_4bit A0(x[3:0],y[3:0],1'b0,z[3:0],c[1]);
//     adder_4bit A1(x[7:4],y[7:4],c[1],z[7:4],c[2]);
//     adder_4bit A2(x[11:8],y[11:8],c[2],z[11:8],c[3]);
//     adder_4bit A3(x[15:12],y[15:12],c[3],z[15:12],carry);

// endmodule

// Structural modeling of Carry Lookahead Adder
module adder_4bit(a,b,cin,s,cout);

    input [3:0] a,b;
    input cin;
    output [3:0] s;
    output cout;
    wire p0,g0,p1,g1,p2,g2,p3,g3;
    wire c1,c2,c3;

    assign p0=a[0]^b[0], p1=a[1]^b[1], p2=a[2]^b[2], p3=a[3]^b[3];
    assign g0=a[0]&b[0], g1=a[1]&b[1], g2=a[2]&b[2], g3=a[3]&b[3];

    assign  c1 = g0|(p0&cin), 
            c2 = g1|(p1&g0)|(p1&p0&cin), 
            c3 = g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&cin),
            cout = g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&cin);

    assign s[0] = p0^cin, s[1] = p1^c1, s[2] = p2^c2, s[3] = p3^c3;

endmodule

module adder_16bit(x,y,z,sign,zero,carry,parity,overflow);
    
    input [15:0] x,y;
    output [15:0] z;
    output sign,zero,carry,parity,overflow;
    wire c[3:1];
    
    //assign {carry,z} = x+y;
    assign sign = z[15];
    assign zero = ~|z;
    assign parity = ~^z;
    assign overflow = (x[15]&y[15]&~z[15])|(~x[15]&~y[15]&z[15]);

    adder_4bit A0(x[3:0],y[3:0],1'b0,z[3:0],c[1]);
    adder_4bit A1(x[7:4],y[7:4],c[1],z[7:4],c[2]);
    adder_4bit A2(x[11:8],y[11:8],c[2],z[11:8],c[3]);
    adder_4bit A3(x[15:12],y[15:12],c[3],z[15:12],carry);

endmodule

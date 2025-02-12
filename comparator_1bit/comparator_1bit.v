//`timescale 1ns/100ps

module comparator_1bit(x,y,z);
    
    input [1:0] x,y;
    output z;

    assign z = (x[0]&y[0]&x[1]&y[1]) |
               (~x[0]&~y[0]&x[1]&y[1]) |
               (~x[0]&~y[0]&~x[1]&~y[1]) |
               (x[0]&y[0]&~x[1]&~y[1]);

endmodule
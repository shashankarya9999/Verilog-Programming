// generate statement allows verilog code to be generated dynamically before simulation or synthesis begins
// one of the use cases of generate statements
// How to use "generate" to dynamically create N copies of full adder, and connect them to make a N-bit ripple carry adder

module ripple_carry_adder_nbit(a,b,c_in,sum,c_out);
    parameter N=8;
    input [N-1:0] a,b;
    input c_in;
    output [N-1:0] sum;
    output c_out;
    wire [N:0] carry; 
    // carry[0] is the carry-in to the first full adder
    // carry[N] is the carry-out from the last full adder

    assign carry[0]=c_in;
    assign carry[N]=c_out;

    genvar i;
    generate for(i=0; i<N; i++)
        begin: full_adder_loop
            wire t1,t2,t3;
            xor G1(t1,a[i],b[i]), G2(sum[i],t1,carry[i]);
            and G3(t2,a[i],b[i]), G4(t3,t1,carry[i]);
            or G5(carry[i+1],t2,t3);
        end
    endgenerate

    // some of the relative hierarchical instance names that are generated are:
    // full_adder_loop[0].G1, full_adder_loop[1].G1, full_adder_loop[2].G1, full_adder_loop[3].G1, full_adder_loop[4].G1, full_adder_loop[5].G1, full_adder_loop[6].G1, full_adder_loop[7].G1 etc
    // some of the nets('wires') that are generated are:
    // full_adder_loop[0].t1, full_adder_loop[1].t2, full_adder_loop[0].t3 etc

endmodule

/*

// structural gate-level description of a full adder
module full_adder(a,b,c_in,sum,c_out);
    input a,b,c_in;
    output sum,c_out;
    wire t1,t2,t3;
    xor G1(t1,a,b), G2(sum,t1,c_in);
    and G3(t2,a,b), G4(t3,t1,c_in);
    or G5(c_out,t2,t3);
endmodule

*/
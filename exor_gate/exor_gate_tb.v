module exor_gate_tb;

reg r1,r2;
wire w1;

exor_gate X1(r1,r2,w1);

initial begin
 
    $dumpfile("test_exor.vcd")
    $dumpvars(0,exor_gate_tb);

    r1 = 0; r2 = 0;
    #10;
    r1 = 0; r2 = 1;
    #10;
    r1 = 1; r2 = 0;
    #10;
    r1 = 1; r2 = 1;
    #10;

end

endmodule

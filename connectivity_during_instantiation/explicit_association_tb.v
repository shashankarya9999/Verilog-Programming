module explicit_tb;

reg x1,x2,x3,x4,x5,x6;
wire OUT;
// explicit association
// <.><ports_from_module>(<ports_from_testbench>)
explicit DUT(.y(OUT),.a(x1),.b(x2),.c(x3),.d(x4),.e(x5),.f(x6));

initial begin

    // $dumpfile("positional_association.vcd")
    // $dumpvars(0,positional_association_tb);

    $monitor($time," x1=%b x2=%b x3=%b x4=%b x5=%b x6=%b OUT=%b",x1,x2,x3,x4,x5,x6,OUT);
    #5 x1=1; x2=0; x3=0; x4=1; x5=0; x6=0;
    #5 x1=0; x3=1;
    #5 x1=1; x3=0;
    #5 x6=1;
    #5 $finish;

end

endmodule
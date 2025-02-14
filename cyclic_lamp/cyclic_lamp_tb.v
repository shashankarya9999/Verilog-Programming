module cyclic_lamp_tb;

    reg clk;
    wire [0:2] light;
    cyclic_lamp LAMP(clk,light);
    always #5 clk=~clk;
    initial
        begin   
            clk=1'b0;
            #100 $finish;
        end
    initial
        begin
            $dumpfile("cyclic.vcd");
            $dumpvars(0,cyclic_lamp_tb);
            $monitor("t=%0d, RGY: %b",$time,light);
        end
endmodule
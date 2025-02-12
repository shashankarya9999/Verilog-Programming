module counter_7bit_tb;

    reg clk,clr;
    wire [7:0] out;

    counter DUT(clr,clk,out);

    initial clk = 1'b0;

    always #5 clk=~clk;

    initial
        begin   
            clr=1'b1;
            #15 clr=1'b0;
            #200 clr = 1'b1;
            #10 $finish;
        end

    initial 
        begin
            $dumpfile("counter.vcd");
            $dumpvars(0,counter_7bit_tb);
            $monitor($time," Count: %d",out);
        end

endmodule
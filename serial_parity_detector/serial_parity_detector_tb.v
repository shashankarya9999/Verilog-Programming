module serial_parity_detector_tb;

    reg clk,x;
    wire z;
    serial_parity_detector DUT(x,clk,z);
    initial
        begin
            $dumpfile("parity.vcd");
            $dumpvars(0,serial_parity_detector_tb);
            clk=1'b0;
        end
    
    always #5 clk=~clk;
    initial
        begin
            #2 x=0;
            #10 x=1;
            #10 x=1;
            #10 x=1;
            #10 x=0;
            #10 x=1;
            #10 x=1;
            #10 x=0;
            #10 x=0;
            #10 x=1;
            #10 x=1;
            #10 x=0;
            #10 $finish;        
        end

endmodule
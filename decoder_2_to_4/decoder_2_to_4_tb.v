module decoder_2_to_4_tb;

    reg x,y,en;
    wire [3:0] z;

    decoder_2_to_4 DUT(x,y,en,z);

    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0,decoder_2_to_4_tb);
        x=0; y=0; en=0;
        #10 x=0; y=0; en=1;
        #10 x=0; y=1; en=1;
        #10 x=1; y=0; en=1;
        #10 x=1; y=1; en=1;
        #10 $finish;
    end

    initial begin
        $monitor("t=%d, x=%d, y=%d, en=%d, z[0]=%d, z[1]=%d, z[2]=%d, z[3]=%d", $time, x,y,en,z[0],z[1],z[2],z[3]);
    end

endmodule
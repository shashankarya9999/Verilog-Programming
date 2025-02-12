module decoder_3_to_8_tb;

    reg x,y,z,en;
    wire [7:0] w;

    decoder_3_to_8 DUT(x,y,z,en,w);

    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0,decoder_3_to_8_tb);
        x=x; y=x; z=x; en=0;
        #10 x=x; y=x; z=x; en=1;
        #10 x=0; y=0; z=0; en=0;
        #10 x=0; y=0; z=0; en=1;
        #10 x=0; y=0; z=1; en=1;
        #10 x=0; y=1; z=0; en=1;
        #10 x=0; y=1; z=1; en=1;
        #10 x=1; y=0; z=0; en=1;
        #10 x=1; y=0; z=1; en=1;
        #10 x=1; y=1; z=0; en=1;
        #10 x=1; y=1; z=1; en=1;
        #10 $finish;
    end

    initial begin
        $monitor("t=%3d, x=%d, y=%d, z=%d, en=%d, w[0]=%d, w[1]=%d, w[2]=%d, w[3]=%d, w[4]=%d, w[5]=%d, w[6]=%d, w[7]=%d", $time, x,y,z,en,w[0],w[1],w[2],w[3],w[4],w[5],w[6],w[7]);
    end

endmodule
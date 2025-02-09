module sr_latch_tb;

    reg s,r;
    wire q,qbar;    
    
    sr_latch DUT(s,r,q,qbar);

    initial begin
        
        $monitor($time,"s = %b, r = %b, q = %b, qbar = %b",s,r,q,qbar);
        s = 1'b0; r=1'b1;
        #5 s = 1'b1; r=1'b1;
        #5 s = 1'b1; r=1'b0;
        #5 s = 1'b1; r=1'b1;
        #5 s = 1'b0; r=1'b0;
        #5 s = 1'b1; r=1'b1;

        // and then simulator hangs because it cannot deduce what to do next
    end
endmodule
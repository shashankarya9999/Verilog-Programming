primitive sr_flip_flop_posedge(q,s,r,clk,clr);

    input s,r,clk,clr;
    output reg q;

    table
        // s    r   clk  clr        q    q_new
           ?    ?    ?    1     :   ?   :   0;  // flip-flop is cleared
           ?    ?    ?   (10)   :   ?   :   -;  // no change
           0    0  (01)   0     :   ?   :   -;  // no change
           0    1  (01)   0     :   ?   :   0;  // reset condition
           1    0  (01)   0     :   ?   :   1;  // set condition
           1    1  (01)   0     :   ?   :   x;  // invalid condition
           ?    ?  (10)   0     :   ?   :   -;  // no change

    endtable

endprimitive
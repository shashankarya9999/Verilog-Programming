// a negative edge sensitive JK flip-flop
primitive jk_flip_flop_negedge(q,j,k,clk,clr);
    input j,k,clk,clr;
    output reg q;

    table
        // j    k   clk  clr        q    q_new
           ?    ?    ?    1     :   ?   :   0;  // flip-flop is cleared
           ?    ?    ?   (10)   :   ?   :   -;  // no change
           0    0  (10)   0     :   ?   :   -;  // no change
           0    1  (10)   0     :   ?   :   0;  // reset condition
           1    0  (10)   0     :   ?   :   1;  // set condition
           1    1  (10)   0     :   0   :   1;  // toggle condition
           1    1  (10)   0     :   1   :   0;  // toggle condition
           ?    ?  (01)   0     :   ?   :   -;  // no change

    endtable
endprimitive
// a level-sensitive D type latch
primitive d_latch_udp(q,d,clk,clr);
    input d,clk;
    output reg q;

    initial 
        q=0;    // optional

    table
        // d clk clr    q    q_new
           ?  ?   1  :  ?   :   0;  // latch is cleared
           0  1   0  :  ?   :   0;  // latch is reset
           1  1   0  :  ?   :   1;  // latch is set
           ?  0   0  :  ?   :   -;  // retains previous state

    endtable
endprimitive
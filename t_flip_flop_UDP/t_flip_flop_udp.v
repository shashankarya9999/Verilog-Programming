// a T flip flop
primitive t_flip_flop_udp(q,clk,clr);
    input clk,clr;
    output reg q;

    table
        // clr  clr q   q_new
            ?    1   :  ?   :   0;  // flip-flop is cleared
            ?   (10) :  ?   :   -;  // ignore -ve edge of "clr"
           (10)  0   :  1   :   0;  // flip-flop toggles at -ve edge of "clk"
           (10)  0   :  0   :   1;  // flip-flop toggles at -ve edge of "clk"
           (0?)  0   :  ?   :   -;  // ignore +ve edge of "clk"
    endtable
endprimitive
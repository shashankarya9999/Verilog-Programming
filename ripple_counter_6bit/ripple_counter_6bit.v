module ripple_counter_6bit(count, clk, clr);
    input clk, clr;
    output [5:0] count;

    t_flip_flop_udp F0(count[0], clk, clr);
    t_flip_flop_udp F1(count[1], count[0], clr);
    t_flip_flop_udp F2(count[2], count[1], clr);
    t_flip_flop_udp F3(count[3], count[2], clr);
    t_flip_flop_udp F4(count[4], count[3], clr);
    t_flip_flop_udp F5(count[5], count[4], clr);

endmodule
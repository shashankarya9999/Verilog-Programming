// D Flip Flop with synchronous set and reset
module d_flip_flop(d,set,reset,clk,q,qbar);

    input d,set,reset,clk;
    output reg q;
    output qbar;

    assign qbar = ~q;

    always @(posedge clk)
        begin
            // set and reset are active low signals
            if(reset == 0)  q<=0;
            else if(set == 0) q<=1;
            else q<=d;
        end
endmodule

// D Flip Flop with asynchronous set and reset
module d_flip_flop(d,set,reset,clk,q,qbar);

    input d,set,reset,clk;
    output reg q;
    output qbar;

    assign qbar = ~q;

    always @(posedge clk or negedge set or negedge reset)
        begin
            // set and reset are active low signals
            if(reset == 0)  q<=0;
            else if(set == 0) q<=1;
            else q<=d;
        end
endmodule

// Negative edge triggered D Flip Flop
module d_flip_flop_negedge(d,clock,q,qbar);

    input d,clock;
    output reg q,qbar;

    always @(negedge clock)
        begin
            q=d;
            qbar=~d;
        end
endmodule

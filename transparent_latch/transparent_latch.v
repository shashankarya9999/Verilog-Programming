// Transparent latch with enable
module latch(q,qbar,din,enable)

    input din,enable;
    output reg q;
    output qbar;

    assign qbar = ~q;

    always @(din or enable)
        begin
            if(enable == 1) q=din;
        end
endmodule
module serial_parity_detector(x,clk,z);

    // this design will cause the synthesis tool to generate a latch for the output "even_odd"

    input x,clk;
    output reg z;
    reg even_odd;   // machine state
    parameter EVEN=0, ODD=1;

    always @(posedge clk)
        case(even_odd)
            EVEN: begin
                    z <= x ? 1 : 0;
                    even_odd <= x ? ODD : EVEN;
                  end
            ODD: begin
                    z <= x ? 0 : 1;
                    even_odd <= x ? EVEN : ODD;
                 end
            default: even_odd <= EVEN;
        endcase
endmodule

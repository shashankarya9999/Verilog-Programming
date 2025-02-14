// module serial_parity_detector(x,clk,z);

//     // this design will cause the synthesis tool to generate a latch for the output z and state "even_odd"

//     input x,clk;
//     output reg z;
//     reg even_odd;   // machine state
//     parameter EVEN=0, ODD=1;

//     always @(posedge clk)
//         case(even_odd)
//             EVEN: begin
//                     z <= x ? 1 : 0;
//                     even_odd <= x ? ODD : EVEN;
//                   end
//             ODD: begin
//                     z <= x ? 0 : 1;
//                     even_odd <= x ? EVEN : ODD;
//                  end
//             default: even_odd <= EVEN;
//         endcase
// endmodule

module serial_parity_detector(x,clk,z);

    // this design will not cause the synthesis tool to generate a latch for the output "even_odd"

    input x,clk;
    output reg z;
    reg even_odd;   // machine state
    parameter EVEN=0, ODD=1;

    always @(posedge clk)
        case(even_odd)
            EVEN: even_odd <= x ? ODD : EVEN;
            ODD: even_odd <= x ? EVEN : ODD;
            default: even_odd <= EVEN;
        endcase
    
    always @(even_odd)
        case(even_odd)
            EVEN: z=0;
            ODD: z=1;
        endcase
endmodule


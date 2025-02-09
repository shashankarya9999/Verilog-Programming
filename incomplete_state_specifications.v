// When a "case" statement is incompletely decoded, the synthesis tool will infer the need for a latch to hold the residual output when the select bits take the unspecified values.
// It is up to the designer to code the design in such a way that latch can be avoided where possible.

module incomplete_state_specifications(curr_state, flag);

    input [0:1] curr_state;
    output reg [0:1] flag;

    // variable flag is not assigned a value in all the branches of "case" statement
    // a latch(2-bit) will be generated for "flag"

    always @(curr_state)
        case(curr_state)
            0,1 : flag=2;
            3   : flag=0;
        endcase
endmodule

// a small modification to make sure a sequencial circuit is not generated
// a purely combinational circuit is generated
module incomplete_state_specifications(curr_state, flag);

    input [0:1] curr_state;
    output reg [0:1] flag;

    // the variable flag is defined for all the possible values of "curr_state"
    // a purely combinational circuit is generated
    // latch is avoided

    always @(curr_state)
    begin
        flag=0;
        case(curr_state)
            0,1 : flag=2;
            3   : flag=0;
        endcase
    end
endmodule

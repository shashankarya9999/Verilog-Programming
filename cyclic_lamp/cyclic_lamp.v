module cyclic_lamp(clock,light);

    // Moore Machine

    input clock;
    output reg [0:2] light;
    parameter s0=0, s1=1, s2=2;
    parameter RED=3'b100, GREEN=3'b010, YELLOW=3'b001;
    reg [0:1] state;
    
    always @(posedge clock)
        case(state)
            s0: begin   // s0 means RED
                    light<=GREEN;
                    state<=s1;
                end
            s1: begin   // s1 means GREEN
                    light<=YELLOW;
                    state<=s2;
                end
            s2:
                begin   // s2 means YELLOW
                    light <= RED;
                    state<=s0;                
                end
            default:
                begin
                    light<=RED;
                    state<=s0;
                end
        endcase
endmodule

// In this particular approach, the synthesis tool will generate five flip-flops -2 for state and 3 for light.
// The three output lines are also getting stored in flip-flops(we have used non-blocking assignments triggered by clock edge)
// But actually we do not need seperate flip-flops for the outputs, as the outputs can be directly generated from the state
// To achieve this,
// we modify the verilog code such that all assignments to light is made in a seperate "always" block
// and we use blocking assignments triggered by state change, and not by clock
// an improvement over the above design
module cyclic_lamp(clock,light);

    // the synthesis tool will be generating only 2 flip-flops corresponding to the first clock-triggered "always" block
    // the second "always" block will be generating a combinational circuit that takes state as input and produces light as outputs
    // after k-map minimization, R=(~s0).(~s1)
    //                           G=s0
    //                           Y=s1

    input clock;
    output reg [0:2] light;
    parameter s0=0, s1=1, s2=2;
    parameter RED=3'b100, GREEN=3'b010, YELLOW=3'b001;
    reg [0:1] state;
    
    always @(posedge clock)
        case(state)
            s0: state<=s1;
            s1: state<=s2;
            s2: state<=s0;
            default: state<=s0;
        endcase

    always @(state)
        case(state)
            s0: light=RED;
            s1: light=GREEN;
            s2: light=YELLOW;
            default: light=RED;
        endcase
endmodule

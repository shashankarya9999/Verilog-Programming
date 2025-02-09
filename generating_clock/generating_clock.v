module generating_clock;

    // "initial" and "always" blocks can coexist in the same module
    // They all execute concurrently; "initial" blocks are executed only once and "always" repeatedly
    
    output reg clk;

    initial
        clk = 1'b0; // initialized to 0 at time 0

    always
        #5 clk = ~clk; // toggles after 5 time units

    initial 
        #500 $finish; // finishes simulation after 500 time units

endmodule
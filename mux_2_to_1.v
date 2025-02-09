module mux_2_to_1(in1,in0,s,f);

    input in1,in0,s;
    output reg f;

    // The event expression in the 'always' block triggers whenever at least one of "in1","in0" or "s" changes
    // we can combine various triggering conditions by seperating them by commas or "or" keyword
    // or keyword specifies the condition or "," in latest version of Verilog
    // always @(in1, in0, s)
    // whenever any of the variables changes
    // always @(*)
    always @(in1 or in0 or s)
        begin
            if(s)   f = in1;
            else    f = in0;
        end

endmodule
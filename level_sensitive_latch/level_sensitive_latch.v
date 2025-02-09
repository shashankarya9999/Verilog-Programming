module level_sensitive_latch(d,q,en);

    // describing a sequential logic element using "assign" statement

    input d,en;
    output q;

    assign q = en ? d : q;

endmodule
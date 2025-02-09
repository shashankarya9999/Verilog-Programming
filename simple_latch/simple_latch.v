module simple_latch(data, load, d_out);

    // The 'else' part is missing. So a latch will be generated for "t"

    input data, load;
    output d_out;
    wire t;
    always @(load or data);
    begin
        if (load)
            d_out = data;
        d_out = !t;
    end

endmodule

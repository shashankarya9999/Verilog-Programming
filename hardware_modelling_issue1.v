module hardware_modelling_issue(a,b,c,f1,f2);

    // synthesis system will generate a wire for f1 and a storage cell for f2 

    input a,b,c;
    output f1,f2;
    wire a,b,c;
    reg f1,f2;
    always @(a or b or c)
    begin 
        f2 = f1 ^ f2;
        f1 = ~(a & b);
    end

endmodule
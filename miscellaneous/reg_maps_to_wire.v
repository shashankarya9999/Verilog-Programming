module reg_maps_to_wire(a,b,c,f1,f2);

    // although we have declared f1,f2 as a reg type,
    // both f1 and f2 will not require any storage cell either flip-flop or latch
    // so synthesis system will generate a wire for f1 and f2

    input a,b,c;
    output f1,f2;
    wire a,b,c;
    reg f1,f2;
    always @(a or b or c)
    begin
        f1 = ~(a & b);
        f2 = f1 ^ c;

    end

endmodule
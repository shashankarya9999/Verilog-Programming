// n-bit comparator
module comparator_nbit(a,b,lesser,greater,equal);

    parameter word_size = 16;
    input [(word_size-1):0] a,b;
    output reg lesser,greater,equal;

    always @(*)
        begin
            greater = 0; lesser = 0; equal = 0;
            if(a>b)         greater = 1;
            else if(a<b)    lesser = 1;
            else            equal = 1;
        end

endmodule
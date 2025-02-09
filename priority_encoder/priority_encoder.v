module priority_encoder(in,code);

    input [7:0] in;
    output reg [2:0] code;
    
    // the input bits are checked sequentially one by one(in order of their priority)
    // "in[0]" has the highest priority and "in[7]" has the lowest priority
    // For simultaneous active inputs, the first active input encountered will be encoded

    always @(in)
        begin
            if(in[0])       code=2'b000;
            else if(in[1])  code=2'b001;
            else if(in[2])  code=2'b010;
            else if(in[3])  code=2'b011;
            else if(in[4])  code=2'b100;
            else if(in[5])  code=2'b101;
            else if(in[6])  code=2'b110;
            else if(in[7])  code=2'b111;
            else            code=2'bxxx;
        end
endmodule
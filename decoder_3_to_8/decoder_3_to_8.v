module decoder_3_to_8(a,b,c,en,y);

    input a,b,c;
    input en;
    output [7:0] y;
    
    assign y[0] = (~a)&(~b)&(~c)&(en);
    assign y[1] = (~a)&(~b)&(c)&(en);
    assign y[2] = (~a)&(b)&(~c)&(en);
    assign y[3] = (~a)&(b)&(c)&(en);
    assign y[4] = (a)&(~b)&(~c)&(en);
    assign y[5] = (a)&(~b)&(c)&(en);
    assign y[6] = (a)&(b)&(~c)&(en);
    assign y[7] = (a)&(b)&(c)&(en);
    
endmodule
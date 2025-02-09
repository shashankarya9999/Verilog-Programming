module async_reset_counter_4bit(clk,reset,count);

    input clk,reset;
    output reg [3:0] count;

    always @(posedge clk or posedge reset)
        begin
            if(reset)   count <= 0;
            else        count <= count + 1;
        end
endmodule
module add_8bit_tb;
    reg [7:0] a,b;
    wire [7:0] sum;
    wire cout;
    integer seed;

    add_8bit DUT(sum,cout,a,b);

    initial seed = 15;

    initial 
        begin
            repeat(5)
                begin
                    a=$random(seed);
                    b=$random(seed); #10;
                    $display("t=%0d, a=%h, b=%h, sum=%h",$time,a,b,sum);
                end
        end

endmodule
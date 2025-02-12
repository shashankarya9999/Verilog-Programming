module full_adder_tb3;

    reg a,b,c_in;
    wire sum,c_out;
    integer i;

    full_adder FA(a,b,c_in,sum,c_out);

    initial
        begin
            for(i=0; i<8; i=i+1)
                begin
                    {a,b,c_in} = i;
                    #5;
                    $display("t=%0d, a=%b, b=%b, c_in=%b, sum=%b, c_out=%b",$time,a,b,c_in,sum,c_out);
                end
            #5 $finish;
        end
endmodule
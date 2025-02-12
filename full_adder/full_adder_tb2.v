module full_adder_tb2;

    reg a,b,c_in;
    wire sum,c_out;

    full_adder FA(a,b,c_in,sum,c_out);

    initial
        begin
            #5 a=0; b=0; c_in=1;
            $display("t=%0d, a=%b, b=%b, c_in=%b, sum=%b, c_out=%b",$time,a,b,c_in,sum,c_out);
            #5 b=1;
            $display("t=%0d, a=%b, b=%b, c_in=%b, sum=%b, c_out=%b",$time,a,b,c_in,sum,c_out);
            #5 a=1;
            $display("t=%0d, a=%b, b=%b, c_in=%b, sum=%b, c_out=%b",$time,a,b,c_in,sum,c_out);
            #5 a=0; b=0; c_in=0;
            $display("t=%0d, a=%b, b=%b, c_in=%b, sum=%b, c_out=%b",$time,a,b,c_in,sum,c_out);
            #5 $finish;
        end
endmodule
module testbench;

    reg a,b,c;
    wire sum,c_out;
    full_adder FA(a,b,c_in,sum,c_out);

    initial
        begin
            $monitor($time,"a=%b, b=%b, c_in=%b, sum=%b, c_out=%b",a,b,c_in,sum,c_out);
            #5 a=0; b=0; c_in=1;
module shift_test;

    reg clk, clr, in;
    wire out;
    integer i;
    shift_reg_4bit SR(in,clk,clr,out);

    initial
        begin
            clk=1'b0;
            #2 clr=0;
            #5 clr=1;
        end

    always #5 clk=~clk;

    initial begin #2
        repeat (2)
            begin 
                #10 in=0;
                #10 in=0;
                #10 in=1;
                #10 in=1;
            end
    end

    initial
        begin
            $dumpfile("shift.vcd");
            $dumpvars(0,shift_test);
            #200 $finish;
        end

endmodule
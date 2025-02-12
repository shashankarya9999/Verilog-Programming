module full_adder_tb3;

    reg a,b,c_in;
    wire s,c_out;
    integer correct;

    full_adder FA(a,b,c_in,sum,c_out);

    initial
        begin
            correct=1;

            #5 a=1; b=1; c_in=0; #5;
                if((s!=0)||(c_out!=1))
                    correct = 0;
            
            #5 a=1; b=1; c_in=1; #5;
                if((s!=1)||(c_out!=1))
                    correct = 0;
             
            #5 a=0; b=1; c_in=0; #5;
                if((s!=1)||(c_out!=0))
                    correct = 0;
            
            #5 $display("%d",correct);
        end
endmodule
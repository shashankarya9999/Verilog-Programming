module comparator_2bit(a1,a0,b1,b0,lesser,greater,equal);
    input a1,a0,b1,b0;
    output reg lesser,greater,equal;

    always @(a1,a0,b1,b0)
        begin
            lesser = ({a1,a0}<{b1,b0});
            greater = ({a1,a0}>{b1,b0});
            equal = ({a1,a0}=={b1,b0});
        end
        
endmodule
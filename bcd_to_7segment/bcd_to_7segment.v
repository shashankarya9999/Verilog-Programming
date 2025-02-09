module bcd_to_7segment(bcd,segment);

    input [3:0] bcd;
    output reg [6:0] segment;

    // segment bit assignment: (a,b,c,d,e,f,g)
    // a segment glows when the corresponding bit of segment is 0

    parameter zero = 4'b0000, one = 4'b0001, two = 4'b0010, three = 4'b0011, four = 4'b0100, five = 4'b0101, six = 4'b0110, seven = 4'b0111, eight = 4'b1000, nine = 4'b1001;

    always @(bcd)
        case    
                zero:   segment = 7'b0000001;
                one:    segment = 7'b1001111;
                two:    segment = 7'b0010010;
                three:  segment = 7'b0000110;
                four:   segment = 7'b1001100;
                five:   segment = 7'b0100100;
                six:    segment = 7'b0100000;
                seven:  segment = 7'b0001111;
                eight:  segment = 7'b0000000;
                nine:   segment = 7'b0000100;
              default:  segment = 7'b1111111;
        endcase
endmodule
// Instantiating UDP's
// A full adder description
module full_adder_udp(sum,cout,a,b,c);

    input a,b,c;
    output sum,cout;

    sum_udp SUM(sum,a,b,c);
    carry_udp CARRY(cout,a,b,c);

endmodule

module demux_4bit(in,select,out);

    input in;
    input [0:1] select;
    output [0:3] out;

    assign out[select] = in;

endmodule
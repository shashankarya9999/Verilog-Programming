// simple 8 bit ALU with 7 functions
module ALU_8bit(a,b,op,enable,alu_out);

    input [2:0] op;
    input [7:0] a,b;
    input enable;
    reg [7:0] alu_reg;

    assign alu_out = (enable==1) ? alu_reg : 8'zzzzzzzz;

    parameter ADD=3'b000, SUB=3'b001, MUL=3'b010, DIV=3'b011, AND=3'b100, OR=3'b101, XOR=3'b110;

    always @(*)
        case(op)
            ADD: alu_reg = a + b;
            SUB: alu_reg = a - b;
            MUL: alu_reg = a * b;
            DIV: alu_reg = a / b;
            AND: alu_reg = a & b;
            OR: alu_reg = a | b;
            XOR: alu_reg = a ^ b;
            default: alu_reg = 8'b00000000;
        endcase
endmodule

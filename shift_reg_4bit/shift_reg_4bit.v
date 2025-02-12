// // using blocking assignment
// // 4-bit shift register
// module shift_reg_4bit(a,clock,clear,e);

//     input clock,clear,a;
//     output reg e;
//     reg b,c,d;

//     always @(posedge clock or negedge clear)
//         begin
//             if(!clear) begin b=0; c=0; d=0; e=0; end
//             else begin
//                 b=a;
//                 c=b;
//                 d=c;
//                 e=d;
//             end
//         end
// endmodule

// // reversing order of procedural assignments
// // value of a directly going to e
// module shift_reg_4bit(a,clock,clear,e);

//     input clock,clear,a;
//     output reg e;
//     reg b,c,d;

//     // effect of the assignment made by first statement(b=a) is immediate
//     // thus, b changes, and the updated value is used in the second assignment(c=b)
//     // the updated value of c is used in the third statement(d=c)
//     // the updated value of d is used in the fourth statement(e=d)
//     // the statements execute sequentially
//     // but at the same time step of the simulator
//     // the four statements are equivalent to a single statement that assigns a to e
//     // so the synthesized design is just a d flip-flop

//     always @(posedge clock or negedge clear)
//         begin
//             if(!clear) begin b=0; c=0; d=0; e=0; end
//             else begin
//                 b=a;
//                 c=b;
//                 d=c;
//                 e=d;
//             end
//         end
// endmodule

// using non-blocking assignments
module shift_reg_4bit(a,clock,clear,e);

    input clock,clear,a;
    output reg e;
    reg b,c,d;

    // statements can appear in any order
    // chances of error are less
    // rhs expressions are evaluated in parallel, so that the order of the statements is not important
    always @(posedge clock or negedge clear)
        begin
            if(!clear) begin b=0; c=0; d=0; e=0; end
            else begin
                e<=d;
                d<=c;
                c<=b;
                b<=a;
            end
        end

endmodule

   
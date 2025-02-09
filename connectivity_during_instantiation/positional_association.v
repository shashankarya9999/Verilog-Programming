module positional(a,b,c,d,e,f,y);

    input a,b,c,d,e,f;
    output y;
    wire t1, t2, t3;
    nand #1 G1(t1,a,b);
    and #2 G2(t2,c,~b,d);
    nor #1 G3(t3,e,f);
    nand #1 G4(y,t1,t2,t3);

endmodule
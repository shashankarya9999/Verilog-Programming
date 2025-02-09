module xor_16bit(f,a,b);

    parameter N=16;
    input [N-1:0] a,b;
    output [N-1:0] f;
    genvar p;

    generate for(p=0; p<N; p=p+1)
            // xorlp is name given to the generate loop
            // relative hierarchical names of the xor gates will be:
            // xorlp[0].XG, xorlp[1].XG, xorlp[2].XG, ..., xorlp[15].XG
            begin: xorlp
                xor XG (f[p],a[p],b[p]);
            end
    endgenerate

endmodule
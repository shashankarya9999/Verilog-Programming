// a 4-input AND function
primitive or_4bit_udp(f,a,b,c,d);
    
    input a,b,c,d;
    output f;
    table
        // a b c d   f
           1 ? ? ? : 1;
           ? 1 ? ? : 1;
           ? ? 1 ? : 1;
           ? ? ? 1 : 1;
           0 0 0 0 : 0;
    endtable
    
endprimitive
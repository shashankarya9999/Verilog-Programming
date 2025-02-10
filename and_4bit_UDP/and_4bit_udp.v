// a 4-input AND function
primitive and_4bit_udp(f,a,b,c,d);
    
    input a,b,c,d;
    output f;
    table
        // a b c d   f
           0 ? ? ? : 0;
           ? 0 ? ? : 0;
           ? ? 0 ? : 0;
           ? ? ? 0 : 0;
           1 1 1 1 : 1;
    endtable
    
endprimitive
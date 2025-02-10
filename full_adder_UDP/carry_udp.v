// Full adder carry generation using UDP
primitive sum_udp(cout,a,b,c);
    input a,b,c;
    output sum;

    // truth table is specified for all input combinations
    // we can also specify don't care input combinations as "?"

    table
        //  a b c  cout
            0 0 0 : 0;
            0 0 1 : 0;
            0 1 0 : 0;
            0 1 1 : 1;
            1 0 0 : 0;
            1 0 1 : 1;
            1 1 0 : 1;
            1 1 1 : 1;
    endtable
endprimitive        

// Full adder carry generation using UDP
// using don't care("?")
primitive sum_udp(cout,a,b,c);
    input a,b,c;
    output sum;

    // truth table is specified for all input combinations
    // we can also specify don't care input combinations as "?"

    table
        //  a b c  cout
            0 0 ? : 0;
            0 ? 0 : 0;
            ? 0 0 : 0;
            1 1 ? : 1;
            1 ? 1 : 1;
            ? 1 1 : 1;
    endtable
endprimitive        


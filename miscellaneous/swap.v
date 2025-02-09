// blocking assignment
// here the variables are not correctly swapped
// either a=b will execute before b=a, or vice versa, depending on simulator implementation
// both registers will get the same value(either "a" or "b")(race condition)
always @(posedge clk)
    a=b;
always @(posedge clk)
    b=a;

// non-blocking assignment
// here the variables are correctly swapped
// all rhs variables are read first, and assigned to lhs variables at the positive clock edge
always @(posedge clk)
    a<=b;
always @(posedge clk)
    b<=a;

// trying to swap using blocking assignment

// both "a" and "b" will be getting the value previously stored in "b"
always @(posedge clk)
    begin
        a=b;
        b=a;
    end

// correct swapping will occur, but we need two temporary variables "ta" and "tb"
always @(posedge clk)
    begin
        ta=a;
        tb=b;
        a=tb;
        b=ta;        
    end
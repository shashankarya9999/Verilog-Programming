integer mycount;
initial
begin
    mycount = 0;
    while (mycount < 100)
    begin
        $display("mycount = %d", mycount);
        mycount = mycount + 1;
    end
end
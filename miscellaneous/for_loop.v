integer mycount;
reg [100:1] data;
integer i;

initial 
    for(mycount=0; mycount<=255; mycount=mycount+1)
        $display("My count: %d",mycount);

initial
    for(i=1; i<=100; i=i+1)
        data[i] = 1'b0;
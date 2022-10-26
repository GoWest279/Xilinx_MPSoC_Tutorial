module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
wire [100:0]c;
assign c[0] = cin;
assign cout = c[100];
generate
    genvar ii;
    for(ii=0;ii<100;ii++) begin: add
        bcd_fadd bcd_fadd_int(a[(ii+1)*4-1:ii*4], 
                              b[(ii+1)*4-1:ii*4], 
                              c[ii], 
                              c[ii+1], 
                              sum[(ii+1)*4-1:ii*4]);
    end
endgenerate
endmodule
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

  
    
    assign sum[0] = a[0]^b[0]^cin;
    assign cout[0] = cin&(a[0]^b[0]) | a[0] & b[0];
	generate
    	genvar ii;
        for(ii = 1; ii < 100; ii++) begin: loop_adder
            assign sum[ii] = a[ii]^b[ii]^cout[ii-1]; 
            assign cout[ii] = cout[ii-1]&(a[ii]^b[ii]) | a[ii] & b[ii];
        end
    endgenerate
    
endmodule
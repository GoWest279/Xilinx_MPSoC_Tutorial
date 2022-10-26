module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    reg [99:0]cout_reg;
    reg [99:0]sum_reg;
    always @(*) begin
        sum_reg[0] = a[0]^b[0]^cin;
        cout_reg[0] = (a[0]&b[0]) | (cin&(a[0]^b[0]));
        for(int ii = 1; ii < 100; ii++) begin: add
            sum_reg[ii] = a[ii]^b[ii]^cout[ii-1];
            cout_reg[ii] = (a[ii]&b[ii]) | (cout[ii-1]&(a[ii]^b[ii]));
        end
    end
    assign cout = cout_reg;
    assign sum = sum_reg;
endmodule

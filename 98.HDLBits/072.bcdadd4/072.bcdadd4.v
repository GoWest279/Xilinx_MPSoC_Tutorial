module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [4:0]c;
    assign c[0] = cin;
    bcd_faddt bcd_fadd0(a[3:0],   b[3:0],   c[0], c[1], sum[3:0]);
    bcd_faddt bcd_fadd1(a[7:4],   b[7:4],   c[1], c[2], sum[7:4]);
    bcd_faddt bcd_fadd2(a[11:8],  b[11:8],  c[2], c[3], sum[11:8]);
    bcd_faddt bcd_fadd3(a[15:12], b[15:12], c[3], c[4], sum[15:12]);
    assign cout = c[4];
endmodule

module bcd_faddt(
    input [3:0]a, b,
    input cin,
    output cout,
    output [3:0]sum
);
    wire [4:0]temp_sum = {1'b0, a} + {1'b0, b} + {3'd0, cin};
    assign sum = temp_sum > 5'b01001 ? temp_sum[3:0] + 4'b0110 : temp_sum[3:0]; 
    assign cout = temp_sum > 5'b01001;
endmodule
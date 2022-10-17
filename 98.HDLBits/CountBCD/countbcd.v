module top_module (
    input clk,
    input reset,
    output [3:1]ena,
    output [15:0]q
);
    reg [3:0]cnt = 4'b0000;

    always @(posedge clk) begin
        if(reset | cnt == 4'b1001) begin
            cnt <= 4'b0000;
        end
        else begin
            cnt <= cnt + 4'b0001;
        end
    end

    wire [3:0]dec_l4;
    wire [3:0]dec_m4;
    wire [3:0]dec_h4;

    wire reset_l4 =  (dec_l4 == 4'b1001 & cnt == 4'b1001);
    wire inc_m4 = reset_l4;
    wire reset_m4 = dec_m4 == 4'b1001 & reset_l4;
    wire inc_h4 = reset_m4;
    digit_add dec_l4_int(
        .clk(clk),
        .reset(reset | reset_l4),
        .inc(cnt == 4'b1001),
        .res(dec_l4)
    );

    digit_add dec_m4_int(
        .clk(clk),
        .reset(reset | reset_m4),
        .inc(inc_m4),
        .res(dec_m4)
    );
    digit_add dec_h4_int(
        .clk(clk),
        .reset(reset | (dec_h4 == 4'b1001 & reset_m4)),
        .inc(inc_h4),
        .res(dec_h4)
    );

    //assign ena = {dec_m4 == 4'b1001 & dec_l4 == 4'b1001 & cnt == 4'b1001,
    assign ena = {inc_h4,
                  inc_m4,
                  cnt == 4'b1001};
    assign q = {dec_h4,dec_m4,dec_l4,cnt};
endmodule

module digit_add(
    input clk,
    input reset,
    input inc,
    output reg [3:0]res
);

always @(posedge clk) begin
    if(reset) begin
        res <= 4'b0000;
    end 
    else begin
        if(inc)
            res <= res + 4'b0001;
    end
end
endmodule


module adder_4(
    input [3:0]in,
    output [3:0]out,
    output [3:0]cout
);
    wire [3:0] o_t;
    wire [3:0] c_t;    

    assign o_t[0]  =  in[0]^(1'b1)^(1'b0);
    assign c_t[0] =   in[0]; 

    assign o_t[1]  =  in[1] | c_t[0];
    assign c_t[1] =   in[1] & c_t[0]; 

    assign o_t[2]  =  in[2] | c_t[1];
    assign c_t[2] =   in[2] & c_t[1]; 

    assign o_t[3]  =  in[3] | c_t[2];
    assign c_t[3] =   in[3] & c_t[2]; 

    assign out = o_t;
    assign cout = c_t;

endmodule

module top_module0(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout_low16;
    adder16 adder_16_low16(a[15:0], b[15:0], 1'b0, sum[15:0], cout_low16);
    wire [15:0]sum_high16_0;
    wire ct0, ct1;
    wire [15:0]sum_high16_1;
    adder16 adder_16_high16_0(a[31:16], b[31:16], 1'b0, sum_high16_0, ct0);
    adder16 adder_16_high16_1(a[31:16], b[31:16], 1'b1, sum_high16_1, ct1);
    
    assign sum[31:16] = cout_low16 ? sum_high16_1 : sum_high16_0;
endmodule

module adder16(
    input a,
    input b,
    input c,
    input d,
    input e
);

endmodule
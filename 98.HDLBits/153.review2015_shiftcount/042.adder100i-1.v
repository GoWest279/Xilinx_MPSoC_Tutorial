module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    reg [3:0]buf_q = 4'b0000;
    always @(posedge clk) begin
        if(shift_ena) begin
            buf_q[0] <= data;
            buf_q[1] <= buf_q[0];
            buf_q[2] <= buf_q[1];
            buf_q[3] <= buf_q[2];
        end
        else if(count_ena) begin
            buf_q <= buf_q + 4'b1111; 
        end
    end
   	assign q = buf_q;
endmodule
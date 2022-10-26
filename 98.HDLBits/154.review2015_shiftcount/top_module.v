module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    reg [3:0]buf_q = 4'b0000;
    always @(posedge clk) begin
        if(reset) begin
            buf_q <= 4'b0000; 
        end
        else if(buf_q != 4'b1101) begin
            buf_q[0] <= data;
            buf_q[1] <= buf_q[0];
            buf_q[2] <= buf_q[1];
            buf_q[3] <= buf_q[2];
        end
    end
    assign start_shifting = buf_q == 4'b1101;
endmodule
module top_module (
    input clk,
    input reset,
    output [3:0]q
);
    reg [3:0]cnt = 4'b0000;
    always @(posedge clk) begin
        if(reset) begin
            cnt <= 4'b0000;
        end
        else begin
            if(cnt == 4'b1001)
                cnt <= 4'b0000;
            else
                cnt <= cnt + 4'b0001;
        end
    end
assign q = cnt;
endmodule
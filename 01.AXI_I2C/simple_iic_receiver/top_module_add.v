module top_module (
    input clk,
    input in,
    input reset,
    output done
);
reg [3:0]cnt = 4'b0000;
reg [1:0]state = 2'b00; // 00 idle
                        // 01 start
                        // 11 stop
reg done_t = 1'b0;
always @(posedge clk) begin
    if(reset) begin
        state <= 2'b00;
        cnt <= 4'b0000;
        done_t <= 1'b0;
    end
    else begin
        if(state == 2'b00 && in == 1'b0) begin
            state<= 2'b01;
            cnt <= 4'b0000;
            done_t <= 1'b0;
        end
        else if(state == 2'b01 && cnt != 4'b1000) begin
            done_t <= 1'b0;
            cnt <= cnt + 4'b0001;
        end
        else if(state == 2'b01 && cnt == 4'b1000) begin
            done_t <= in;
            state <= 2'b11;
        end
        else if(state == 2'b11) begin
            if(done_t == 1'b1) begin
                if(in == 1'b0 ) begin
                    state <= 2'b01;
                    cnt <= 4'b0000;
                end
                else begin 
                    state <= 2'b00;
                end
                done_t <= 1'b0;
            end
            else begin
                if(in == 1'b1) begin
                    state <= 2'b00;
                end
            end 
            
        end
    end
end

assign done = done_t;
endmodule
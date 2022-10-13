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

reg [3:0]cnt_t = 0;
wire [3:0]cnt_tw;
assign cnt_tw = cnt_t+ state;
reg [9:0] shift_reg =0;
wire [9:0]shift_reg_t = shift_reg << 1;

always @(posedge clk) begin
    if(reset) begin
        cnt_t <= 0;        
    end
    else begin
        if(state == 2'b01)
            cnt_t <= cnt_tw;
        else 
            cnt_t <= 0;
    end 
end
always @(posedge clk) begin
    if(reset) begin
        shift_reg <= 10'b00_0000_0001;        
    end
    else begin
        if(state == 2'b01)
            shift_reg <= shift_reg_t;
        else 
            shift_reg <= 10'b00_0000_0001;
    end 
end




always @(posedge clk) begin
    if(reset) begin
        state <= 2'b00;
        cnt <= 4'b0000;
        done_t <= 1'b0;
    end
    else begin
        if(state == 2'b00 && in == 1'b0) begin
            state<= 2'b01;
        end
        else if(state == 2'b01 && shift_reg == 10'b01_0000_0000) begin
            done_t <= in;
            state <= 2'b11;
        end
        else if(state == 2'b11) begin
            if(done_t == 1'b1) begin
                state <= {1'b0, ~in};
                done_t <= 1'b0;
            end
            else begin
                if(in == 1'b1)
                    state <= 2'b00;
            end 
            
        end
    end
end

assign done = done_t;
endmodule
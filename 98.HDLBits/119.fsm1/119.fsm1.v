module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        case(in)
            1'b0: next_state <= ~state;
            1'b1: next_state <= state;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset)
            state <= 1'b1;
        else
            if(in == 0)
                state <= next_state;
    end

    // Output logic
            assign out = (state == A) ? 1'b0 : 1'b1;

endmodule
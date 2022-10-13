module tb();
    reg clk;
    reg reset;
    reg in;
    reg [31:0]cnt;
    wire done;
    initial begin
        #0 clk = 0;
           reset = 1;
           in = 1;
           cnt = 0;
        #6  reset = 1'b0;
        #10 in = 1'b0; // start bit
        // #8 in = 1'b1; // bit0
        // #10 in = 1'b0;  //bit1 
        // #10 in = 1'b1; // bit2
        // #10 in = 1'b0;  //bit3
        // #10 in = 1'b1; // bit4
        // #10 in = 1'b0;  //bit5
        // #10 in = 1'b1; // bit6
        // #10 in = 1'b0;  //bit7
        // #10 in = 1'b1; // stop bit
        // #10 in = 1'b0;  // intermedia
        #10 in = 1'b1; // bit0
        #10 in = 1'b0;  //bit1 
        #10 in = 1'b1; // bit2
        #10 in = 1'b0;  //bit3
        #10 in = 1'b1; // bit4
        #10 in = 1'b0;  //bit5
        #10 in = 1'b1; // bit6
        #10 in = 1'b0;  //bit7
        #10 in = 1'b1; // stop bit
        #10 in = 1'b0;  // intermedia
        #10 in = 1'b0; // bit0
        #10 in = 1'b0;  //bit1 
        #10 in = 1'b0; // bit2
        #10 in = 1'b0;  //bit3
        #10 in = 1'b0; // bit4
        #10 in = 1'b0;  //bit5
        #10 in = 1'b0; // bit6
        #10 in = 1'b0;  //bit7
        #10 in = 1'b1; // stop bit
        #10 in = 1'b0;  // intermedia
        #10 in = 1'b0;  // intermedia 
        #10 in = 1'b0; // start bit
        #10 in = 1'b1; // bit0
        #10 in = 1'b0;  //bit1 
        #10 in = 1'b1; // bit2
        #10 in = 1'b0;  //bit3
        #10 in = 1'b1; // bit4
        #10 in = 1'b0;  //bit5
        #10 in = 1'b1; // bit6
        #10 in = 1'b0;  //bit7
        #10 in = 1'b0; // stop bit
        #10 in = 1'b0;  // intermedia
        #10 in = 1'b1;  // intermedia
        #10 in = 1'b0;  // start 
        #10 in = 1'b1; // bit0
        #10 in = 1'b0;  //bit1 
        #10 in = 1'b1; // bit2
        #10 in = 1'b0;  //bit3
        #10 in = 1'b1; // bit4
        #10 in = 1'b0;  //bit5
        #10 in = 1'b1; // bit6
        #10 in = 1'b0;  //bit7
        #10 in = 1'b1; // stop bit
        #10 in = 1'b1;  // intermedia
    
                    
    end

    always #5 clk <=~clk;
    initial begin
        $dumpfile("wave.vcd");        //生成的vcd文件名称
        $dumpvars(0, tb);    //tb模块名称
    end
    always @(posedge clk) begin
        cnt<=cnt+1'b1;
        if(cnt == 100)
        $finish();
    end
    top_module top_module_inst(clk, in, reset, done);

endmodule
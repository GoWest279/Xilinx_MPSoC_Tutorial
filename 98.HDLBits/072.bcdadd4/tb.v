module tb();
    reg clk;
    reg reset;
    wire [3:0]q;
    top_module tb_inst(clk, reset, q);

    initial begin
        #0 clk = 0;
           reset = 1'b1;
        #6 reset = 1'b0;
        #120 reset = 1'b1;
        #10 reset = 1'b0; 
        #50 $finish();
    end    
    always #5 clk = ~clk;
    initial begin
        $dumpfile("wave.vcd");        //生成的vcd文件名称
        $dumpvars(0, tb);    //tb模块名称
    end
endmodule
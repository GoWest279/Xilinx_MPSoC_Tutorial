module tb();
    reg clk;
    reg reset;
    wire [15:0]q;
    wire [3:1]ena;
    top_module tb_inst(clk, reset, ena, q);

    initial begin
        #0 clk = 0;
           reset = 1'b1;
        #6 reset = 1'b0;
       // #120 reset = 1'b1;
        //#10 reset = 1'b0; 
        #2000 $finish();
    end    
    always #5 clk = ~clk;
    initial begin
        $dumpfile("wave.vcd");        //生成的vcd文件名称
        $dumpvars(0, tb);    //tb模块名称
    end
endmodule
module top_module (
    input clk,    // Clocks are used in sequential circuits
    input d,
    output reg q );
// 创建一个最简单的时序电路，D触发器


    always@(posedge clk)
    begin
        q = d;
    end


endmodule
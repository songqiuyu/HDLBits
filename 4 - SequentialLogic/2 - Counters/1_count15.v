// 构建一个0-15的四位二进制计数器，同步复位
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q);

    always@(posedge clk)begin
        if(reset)
            q <= 0;
        else
            q <= q + 1;
    end


endmodule
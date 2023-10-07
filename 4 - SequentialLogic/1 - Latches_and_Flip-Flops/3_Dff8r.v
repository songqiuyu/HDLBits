//synchronous reset 同步复位
// 同步复位意味着复位是跟随时钟的，clk为上升沿的时候采集复位信号



module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output reg[7:0] q
);

    always@(posedge clk)
    begin
        if(reset)
            q = 8'b00000000;
        else
            q = d;

    end



endmodule
// dacade counter ʮ���Ƽ�����
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q);

    always@(posedge clk)begin
        if(reset || q == 4'd9)  //��9��1
            q <= 0;
        else
            q <= q + 1;
    end


endmodule

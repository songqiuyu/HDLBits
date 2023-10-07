// asynchronous reset 异步复位
// 当我按下按钮我就复位，不用管时钟


module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output reg [7:0] q
);

//The only difference in code between synchronous and asynchronous reset flip-flops is in the sensitivity list.
//我们把always里的敏感变量修改就可以实现异步
    always@(posedge clk,posedge areset)
    begin
        if(areset)
            q = 8'b00000000;
        else
            q = d;
    
    end


endmodule
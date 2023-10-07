module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

//  pedge是从0变成1的位
//  ~pedge(x)in(x)

//&表示按位与，&&表示逻辑与
    //要定义一个保存的变量去存储上一个状态
    reg [7:0]q;
    always@(posedge clk)begin
        q <= in;   //q中保存的是我上一次输入的值
        pedge <= ~q & in;   //这次输入和上一次输入比较，必须满足上次是0我这次是1
    end


endmodule
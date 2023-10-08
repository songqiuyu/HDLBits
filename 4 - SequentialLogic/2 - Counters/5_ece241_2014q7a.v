module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 
// 该题的本意是，给你一个4位计数器
// 你用它来实现一个1-12的计数器

    // counter读入的数据，即复位或溢出均为1即可
    assign c_d = 4'd1;

    // 由时序图看出c_enable和enable是完全同步的，不能使用时序
    // 使用边沿触发会导致慢一个周期
    assign c_enable = enable;   //只要我总模块的使能关了，那么我counter的使能必须关
    // 什么时候我能重新读数？当我按下复位的一瞬间，或者我本周期结果是12
    // 因为我的clk是驱动counter的，我提前将c_load改了也会在下一周期进行赋值
    // 同时要求必须是我要计数的时候，enable必须打开，如果我不计数，那就要停在12
    assign c_load = reset || (Q == 4'd12 && enable);

    count4 mycount(
        .clk(clk),   //时钟，采用同步时钟
        .enable(c_enable), //使能
        .load(c_load), //是否读入d
        .d(c_d),    //输入计时器的覆盖值
        .Q(Q)   //最后的输出
    );


endmodule



module count4(
	input clk,
	input enable,
	input load,
	input [3:0] d,
	output reg [3:0] Q
);

endmodule
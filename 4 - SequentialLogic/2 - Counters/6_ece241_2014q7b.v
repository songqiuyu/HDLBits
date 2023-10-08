// the OneHertz signal 1Hz信号，一个周期是一秒
// modulo-10(BCD) counters  模数10计数器
// target: 使用BCD计数器来分频1000hz -> 1hz

/**
*********************该部分理解错误*********************************
// 首先想 1000 hz - > 1 hz
// 即1hz我一秒记一个数，1000hz，我一秒记1000个数，则当我从0记录到499，499的下一个周期
// 我让OneHertz反转一下，即半个周期
*******************************************************************
**/

// 正确题意是计数1000，到第1000的时候，产生一个正脉冲，而不是分频时钟
// 为什么是从999开始产生一个1脉冲，因为从一个不稳定状态到0 即999-0也要占用一个时钟周期
// 故是这样理解的999-0 0-1 1-2 2-3 3-4 4-5 ... 998-999 产生一个高电平


module top_module(
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);


    wire [3:0] Q0, Q1, Q2;

    assign OneHertz = (Q2 == 4'd9 & Q1 == 4'd9 & Q0 == 4'd9) ? 1 : 0;
    assign c_enable[0] = 1;
    assign c_enable[1] = (Q0 == 4'd9 & c_enable[0]) ? 1 : 0;
    assign c_enable[2] = (Q0 == 4'd9 & Q1 == 4'd9 & c_enable[0] & c_enable[1]) ? 1 : 0;

    // c_enable[0]是最低位，c_enable[2]是最高位
    bcdcount d0(
        .clk(clk),
        .reset(reset),
        .enable(c_enable[0]),
        .Q(Q0)
    );
    bcdcount d1(
        .clk(clk),
        .reset(reset),
        .enable(c_enable[1]),
        .Q(Q1)
    );
    bcdcount d2(
        .clk(clk),
        .reset(reset),
        .enable(c_enable[2]),
        .Q(Q2)
    );

endmodule


module bcdcount (
	input clk,
	input reset,
	input enable,
	output reg [3:0] Q
);
// clk是1000hz的时钟，目标是获得OneHertz
// reset是同步复位，高电平
// enable是使能
// Q是输出，一位十进制

endmodule